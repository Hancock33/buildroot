################################################################################
#
# python-maturin
#
################################################################################

PYTHON_MATURIN_VERSION = 1.12.5
PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/a4/15/4c41c4c951718f8c17ed1621b7999afb8d72d69c731c987b47e3c138d4ad
PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit

$(eval $(host-python-package))
