################################################################################
#
# python-maturin
#
################################################################################

PYTHON_MATURIN_VERSION = 1.9.5
PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/6c/0a/70972eb5d1aae3444905fe0875bcef9e6d0ed475d1d0528f7b72ee8a3eb8
PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit

$(eval $(host-python-package))
