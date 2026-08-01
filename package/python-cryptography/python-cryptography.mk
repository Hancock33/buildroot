################################################################################
#
# python-cryptography
#
################################################################################

PYTHON_CRYPTOGRAPHY_VERSION = 50.0.0
PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/de/41/6cbdcf9142d00fe82836fbb51e503e58088575cf7a0fe1dbff6695bf0840
PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
PYTHON_CRYPTOGRAPHY_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography.io
PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
	host-pkgconf \
	host-python-cffi \
	host-python-setuptools \
	openssl
HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = \
	host-pkgconf \
	host-python-cffi \
	host-python-setuptools \
	host-openssl
PYTHON_CRYPTOGRAPHY_ENV = OPENSSL_NO_VENDOR=1
HOST_PYTHON_CRYPTOGRAPHY_ENV = OPENSSL_NO_VENDOR=1
PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check
HOST_PYTHON_CRYPTOGRAPHY_BUILD_OPTS = --skip-dependency-check

$(eval $(python-package))
$(eval $(host-python-package))
