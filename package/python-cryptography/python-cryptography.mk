################################################################################
#
# python-cryptography
#
################################################################################

PYTHON_CRYPTOGRAPHY_VERSION = 46.0.4
PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/78/19/f748958276519adf6a0c1e79e7b8860b4830dda55ccdf29f2719b5fc499c
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
