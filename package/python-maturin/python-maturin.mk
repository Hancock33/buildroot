################################################################################
#
# python-maturin
#
################################################################################

PYTHON_MATURIN_VERSION = 1.11.5
PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/a4/84/bfed8cc10e2d8b6656cf0f0ca6609218e6fcb45a62929f5094e1063570f7
PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit

$(eval $(host-python-package))
