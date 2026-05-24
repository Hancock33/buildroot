################################################################################
#
# python-cython
#
################################################################################

PYTHON_CYTHON_VERSION = 3.2.5
PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/3f/3b/ebd94c8b85f8e41b5015a9ed94ee3df866024d480d05cd08b774684fb81d
PYTHON_CYTHON_SETUP_TYPE = setuptools
PYTHON_CYTHON_LICENSE = Apache-2.0
PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

$(eval $(host-python-package))
