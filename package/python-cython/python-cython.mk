################################################################################
#
# python-cython
#
################################################################################

PYTHON_CYTHON_VERSION = 3.1.0
PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/cf/f7/db37a613aec5abcd51c8000a386a701ac32e94659aa03fa69c3e5c19b149
PYTHON_CYTHON_SETUP_TYPE = setuptools
PYTHON_CYTHON_LICENSE = Apache-2.0
PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

$(eval $(host-python-package))
