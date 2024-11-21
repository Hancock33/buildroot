################################################################################
#
# debianutils
#
################################################################################

DEBIANUTILS_VERSION = 5.21
DEBIANUTILS_SOURCE = debianutils_$(DEBIANUTILS_VERSION).tar.xz
DEBIANUTILS_SITE = https://snapshot.debian.org/archive/debian/20241120T204342Z/pool/main/d/debianutils
DEBIANUTILS_AUTORECONF = YES
DEBIANUTILS_CONF_OPTS = --exec-prefix=/
DEBIANUTILS_LICENSE = GPL-2.0+, SMAIL (savelog)
DEBIANUTILS_LICENSE_FILES = debian/copyright

$(eval $(autotools-package))
