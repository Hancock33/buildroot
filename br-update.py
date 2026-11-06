#!/usr/bin/env python3
"""br-update.py - bump Buildroot packages to their latest upstream release.

For every package given, the script
  1. reads package/<pkg>/<pkg>.mk (version, site, source),
  2. finds the newest upstream release,
  3. rewrites <PKG>_VERSION (and <PKG>_SITE for PyPI packages),
  4. downloads the new tarball and rewrites package/<pkg>/<pkg>.hash
     (tarball line(s) and license-file lines),
  5. optionally commits ("update <pkg> version <new>").

Upstream lookup, chosen from the .mk file:
  * $(call github,org,repo,...) or github.com/<org>/<repo>/releases/download/...
        -> GitHub releases/latest (falls back to tags)
  * files.pythonhosted.org      -> PyPI JSON API (also refreshes the hashed SITE path)
  * anything else               -> scan the SITE directory listing for <SOURCE>
  * OVERRIDES below             -> packages whose layout needs special handling

Examples:
  ./br-update.py -n dbus-python rsync          # show what would change
  ./br-update.py mpv lz4                       # bump version + hashes
  ./br-update.py --no-hash sratom              # version only, leave .hash alone
  ./br-update.py --commit -f packages.txt      # one commit per package
  GITHUB_TOKEN=... ./br-update.py mpv          # avoid GitHub API rate limits

Run from the Buildroot top directory or pass -C /path/to/buildroot.
Python 3.8+, standard library only.
"""
import argparse
import hashlib
import json
import os
import re
import subprocess
import sys
import tarfile
import tempfile
import urllib.error
import urllib.request
from collections import Counter
from pathlib import Path

PYPI_API = os.environ.get("BR_UPDATE_PYPI_API", "https://pypi.org/pypi")
GITHUB_API = os.environ.get("BR_UPDATE_GITHUB_API", "https://api.github.com")
GITHUB_WEB = os.environ.get("BR_UPDATE_GITHUB_WEB", "https://github.com")
USER_AGENT = "br-update/1.0"

PRERELEASE = re.compile(r"(rc|alpha|beta|pre|dev|git|snapshot|nightly)", re.I)

# Packages whose releases cannot be found by scanning SITE.
# "listing": page to scan; "regex": groups are joined with "." to form the version.
OVERRIDES = {
    "libnss": {
        "listing": "https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/",
        "regex": r"NSS_(\d+)_(\d+)(?:_(\d+))?_RTM",
    },
}

HASH_RE = re.compile(r"^(md5|sha1|sha224|sha256|sha384|sha512)\s+([0-9a-f]+)\s+(\S+)\s*$")


class UpdateError(Exception):
    pass


# ----------------------------------------------------------------- helpers --

def http_get(url, as_bytes=False):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    token = os.environ.get("GITHUB_TOKEN")
    if token and url.startswith(GITHUB_API):
        req.add_header("Authorization", "Bearer " + token)
    try:
        with urllib.request.urlopen(req, timeout=60) as resp:
            data = resp.read()
    except urllib.error.HTTPError as e:
        raise UpdateError("HTTP %s for %s" % (e.code, url))
    except urllib.error.URLError as e:
        raise UpdateError("cannot reach %s (%s)" % (url, e.reason))
    return data if as_bytes else data.decode("utf-8", "replace")


def download(url, dest):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=120) as resp, open(dest, "wb") as out:
            while True:
                chunk = resp.read(1 << 20)
                if not chunk:
                    break
                out.write(chunk)
    except urllib.error.HTTPError as e:
        raise UpdateError("download failed: HTTP %s for %s" % (e.code, url))
    except urllib.error.URLError as e:
        raise UpdateError("download failed: %s (%s)" % (url, e.reason))


def version_key(v):
    return tuple(int(x) for x in re.findall(r"\d+", v))


def file_digest(path, algo):
    h = hashlib.new(algo)
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


# ----------------------------------------------------------------- package --

class Pkg:
    def __init__(self, root, name):
        self.name = name
        self.dir = root / "package/gstreamer1" / name
        self.mk_path = self.dir / (name + ".mk")
        self.hash_path = self.dir / (name + ".hash")
        if not self.mk_path.is_file():
            raise UpdateError("no such package: %s" % self.mk_path)
        self.var = re.sub(r"[^A-Za-z0-9]", "_", name).upper()
        self.mk = self.mk_path.read_text()
        self.version = self._get("VERSION")
        if not self.version:
            raise UpdateError("%s_VERSION not found in %s" % (self.var, self.mk_path.name))
        self.site = self._get("SITE") or ""
        self.source = self._get("SOURCE") or "%s-$(%s_VERSION).tar.gz" % (name, self.var)

    def _get(self, key):
        m = re.search(r"^%s_%s\s*[:?]?=\s*(.+?)\s*$" % (self.var, key), self.mk, re.M)
        return m.group(1) if m else None

    def expand(self, text, version):
        text = text.replace("$(subst .,_,$(%s_VERSION))" % self.var, version.replace(".", "_"))
        return text.replace("$(%s_VERSION)" % self.var, version)

    def patches(self):
        return sorted(p.name for p in self.dir.glob("*.patch"))


# ------------------------------------------------------- upstream discovery --

def newest(candidates):
    candidates = [c for c in candidates if not PRERELEASE.search(c)]
    candidates = [c for c in candidates if re.search(r"\d", c)]
    if not candidates:
        raise UpdateError("no stable releases found upstream")
    return max(candidates, key=version_key)


def github_latest_tag(org, repo):
    try:
        data = json.loads(http_get("%s/repos/%s/%s/releases/latest" % (GITHUB_API, org, repo)))
        return data["tag_name"]
    except (UpdateError, KeyError, ValueError):
        tags = json.loads(http_get("%s/repos/%s/%s/tags?per_page=100" % (GITHUB_API, org, repo)))
        return newest([t["name"] for t in tags])


def find_latest(pkg):
    """Return dict(version=..., url=..., site=<new SITE or None>)."""
    old = pkg.version

    if pkg.name in OVERRIDES:
        spec = OVERRIDES[pkg.name]
        text = http_get(spec["listing"])
        found = {".".join(g for g in m.groups() if g) for m in re.finditer(spec["regex"], text)}
        new = newest(sorted(found))
        base = pkg.expand(pkg.site, new)
        return dict(version=new, url=base + "/" + pkg.expand(pkg.source, new), site=None)

    # GitHub: $(call github,org,repo,<tag expr>)
    m = re.match(r"\$\(call github,([^,]+),([^,]+),(.+)\)$", pkg.site)
    if m:
        org, repo, tag_expr = m.groups()
        prefix = tag_expr.replace("$(%s_VERSION)" % pkg.var, "")
        tag = github_latest_tag(org, repo)
        if not tag.startswith(prefix):
            raise UpdateError("latest tag %r does not start with %r" % (tag, prefix))
        new = tag[len(prefix):]
        url = "%s/%s/%s/archive/%s%s/%s" % (GITHUB_WEB, org, repo, prefix, new,
                                             pkg.expand(pkg.source, new))
        return dict(version=new, url=url, site=None)

    # GitHub release assets: https://github.com/org/repo/releases/download/[v]$(VERSION)
    m = re.match(r"https://github\.com/([^/]+)/([^/]+)/releases/download/([^$/]*)\$\(%s_VERSION\)"
                 % pkg.var, pkg.site)
    if m:
        org, repo, prefix = m.groups()
        tag = github_latest_tag(org, repo)
        if not tag.startswith(prefix):
            raise UpdateError("latest tag %r does not start with %r" % (tag, prefix))
        new = tag[len(prefix):]
        url = pkg.expand(pkg.site, new) + "/" + pkg.expand(pkg.source, new)
        url = url.replace("https://github.com", GITHUB_WEB, 1)
        return dict(version=new, url=url, site=None)

    # PyPI
    if "files.pythonhosted.org" in pkg.site:
        stem = pkg.source.split("-$(")[0]
        data = json.loads(http_get("%s/%s/json" % (PYPI_API, stem)))
        new = data["info"]["version"]
        sdists = [u for u in data["urls"] if u.get("packagetype") == "sdist"]
        if not sdists:
            raise UpdateError("PyPI release %s has no sdist" % new)
        url = sdists[0]["url"]
        expected = pkg.expand(pkg.source, new)
        if url.rsplit("/", 1)[-1] != expected:
            raise UpdateError("PyPI sdist is %s but .mk expects %s" % (url.rsplit("/", 1)[-1], expected))
        return dict(version=new, url=url, site=url.rsplit("/", 1)[0])

    # Generic: scan the SITE directory listing for <SOURCE> with a numeric version.
    site = pkg.expand(pkg.site, old)
    if "$(" in site:
        raise UpdateError("cannot expand SITE %r; add an OVERRIDES entry" % pkg.site)
    marker = "$(%s_VERSION)" % pkg.var
    if marker not in pkg.source:
        raise UpdateError("SOURCE %r has no version placeholder" % pkg.source)
    before, after = pkg.source.split(marker, 1)
    rx = re.compile(r"(?<![A-Za-z0-9_])" + re.escape(pkg.expand(before, old)) +
                    r"(\d+(?:\.\d+)*)" + re.escape(pkg.expand(after, old)))
    found = set(rx.findall(http_get(site.rstrip("/") + "/")))
    new = newest(sorted(found))
    return dict(version=new, url=site.rstrip("/") + "/" + pkg.expand(pkg.source, new), site=None)


# ----------------------------------------------------------- file rewriting --

def tar_member_reader(tarball):
    tf = tarfile.open(tarball)
    names = [m.name for m in tf.getmembers()]
    tops = Counter(n.split("/")[0] for n in names if n and n != ".")
    top = tops.most_common(1)[0][0] if tops else ""

    def read(rel):
        for cand in ("%s/%s" % (top, rel), rel):
            try:
                f = tf.extractfile(cand)
            except KeyError:
                continue
            if f is not None:
                return f.read()
        return None
    return read


def rewrite_hash_file(path, old_source, new_source, tarball, notes):
    read_member = tar_member_reader(tarball)
    out = []
    for line in path.read_text().splitlines():
        m = HASH_RE.match(line)
        if not m:
            if re.match(r"#\s*(From|Upstream|Published|Source)\b", line, re.I):
                notes.append("hash file comment may now be stale: %s" % line.strip())
            out.append(line)
            continue
        algo, old_digest, fname = m.groups()
        if fname == old_source:
            out.append("%s  %s  %s" % (algo, file_digest(tarball, algo), new_source))
            continue
        data = read_member(fname)
        if data is None:
            notes.append("%s not found in new tarball; its hash line was left unchanged" % fname)
            out.append(line)
            continue
        digest = hashlib.new(algo, data).hexdigest()
        if digest != old_digest:
            notes.append("%s changed upstream (license text edited?) - review" % fname)
        out.append("%s  %s  %s" % (algo, digest, fname))
    path.write_text("\n".join(out) + "\n")


def rewrite_mk(pkg, new_version, new_site):
    text = pkg.mk
    text = re.sub(r"^(%s_VERSION\s*[:?]?=\s*).+$" % pkg.var,
                  lambda m: m.group(1) + new_version, text, count=1, flags=re.M)
    if new_site and new_site != pkg.site:
        text = re.sub(r"^(%s_SITE\s*[:?]?=\s*).+$" % pkg.var,
                      lambda m: m.group(1) + new_site, text, count=1, flags=re.M)
    pkg.mk_path.write_text(text)


# -------------------------------------------------------------------- main --

def update_package(root, name, args):
    pkg = Pkg(root, name)
    info = find_latest(pkg)
    old, new = pkg.version, info["version"]
    notes = []

    if version_key(new) <= version_key(old):
        return "%-28s %s (up to date%s)" % (name, old, "" if new == old else ", upstream shows " + new), notes, False

    ov, nv = version_key(old), version_key(new)
    if ov[:2] != nv[:2]:
        notes.append("%s -> %s changes major/minor: check build system, options, dependencies" % (old, new))
    if pkg.patches():
        notes.append("%d local patch(es) may need rebasing: %s" % (len(pkg.patches()), ", ".join(pkg.patches())))

    line = "%-28s %s -> %s" % (name, old, new)
    if args.dry_run:
        return line + "  [dry run] " + info["url"], notes, False

    old_source = pkg.expand(pkg.source, old)
    new_source = pkg.expand(pkg.source, new)
    do_hash = not args.no_hash
    if do_hash and not pkg.hash_path.is_file():
        notes.append("no .hash file; only the .mk was updated")
        do_hash = False

    if do_hash:
        with tempfile.TemporaryDirectory(prefix="br-update-") as tmp:
            tarball = os.path.join(tmp, new_source)
            download(info["url"], tarball)
            rewrite_hash_file(pkg.hash_path, old_source, new_source, tarball, notes)
    rewrite_mk(pkg, new, info["site"])
    line += "  (%s)" % ("mk + hash" if do_hash else "mk only")

    if args.commit:
        files = [str(pkg.mk_path.relative_to(root))]
        if do_hash:
            files.append(str(pkg.hash_path.relative_to(root)))
        subprocess.run(["git", "-C", str(root), "add"] + files, check=True)
        subprocess.run(["git", "-C", str(root), "commit", "-q", "-m",
                        "update %s version %s" % (name, new)], check=True)
        line += " committed"
    return line, notes, True


def main():
    ap = argparse.ArgumentParser(description="Bump Buildroot packages to their latest upstream release.")
    ap.add_argument("packages", nargs="*", help="package names, e.g. mpv dbus-python")
    ap.add_argument("-f", "--file", help="file with one package name per line (# comments allowed)")
    ap.add_argument("-C", "--buildroot", default=".", help="Buildroot top directory (default: .)")
    ap.add_argument("-n", "--dry-run", action="store_true", help="only show what would change")
    ap.add_argument("--no-hash", action="store_true", help="bump the .mk only; do not download or touch .hash")
    ap.add_argument("--commit", action="store_true", help="make one git commit per updated package")
    args = ap.parse_args()

    names = list(args.packages)
    if args.file:
        for l in Path(args.file).read_text().splitlines():
            l = l.split("#", 1)[0].strip()
            if l:
                names.append(l)
    names = list(dict.fromkeys(names))
    if not names:
        ap.error("no packages given")

    root = Path(args.buildroot).resolve()
    if not (root / "package").is_dir():
        sys.exit("%s does not look like a Buildroot tree (no package/ directory)" % root)

    failures = 0
    for name in names:
        try:
            line, notes, _ = update_package(root, name, args)
            print(line)
            for n in notes:
                print("    note: " + n)
        except UpdateError as e:
            failures += 1
            print("%-28s ERROR: %s" % (name, e))
        except subprocess.CalledProcessError as e:
            failures += 1
            print("%-28s ERROR: git failed: %s" % (name, e))
    sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()
