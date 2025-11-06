################################################################################
#
# python-cython
#
################################################################################

PYTHON_CYTHON_VERSION = 3.2.0
PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/52/82/01f0b63287cb922e5ba96c5147c30f1e51f541ce91bd178025bb3518b1ba
PYTHON_CYTHON_SETUP_TYPE = setuptools
PYTHON_CYTHON_LICENSE = Apache-2.0
PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

$(eval $(host-python-package))
