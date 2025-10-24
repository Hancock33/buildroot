################################################################################
#
# python-cython
#
################################################################################

PYTHON_CYTHON_VERSION = 3.1.6
PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/e3/58/6a8321cc0791876dc2509d7a22fc75535a1a7aa770b3496772f58b0a53a4
PYTHON_CYTHON_SETUP_TYPE = setuptools
PYTHON_CYTHON_LICENSE = Apache-2.0
PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

$(eval $(host-python-package))
