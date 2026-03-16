################################################################################
#
# python-pyopenssl
#
################################################################################

PYTHON_PYOPENSSL_VERSION = 26.0.0
PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/8e/11/a62e1d33b373da2b2c2cd9eb508147871c80f12b1cacde3c5d314922afdd
PYTHON_PYOPENSSL_SETUP_TYPE = setuptools

PYTHON_PYOPENSSL_LICENSE = Apache-2.0
PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE

$(eval $(python-package))
