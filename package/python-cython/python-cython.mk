################################################################################
#
# python-cython
#
################################################################################

PYTHON_CYTHON_VERSION = 3.1.1
PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/5b/d3/bb000603e46144db2e5055219bbddcf7ab3b10012fcb342695694fb88141
PYTHON_CYTHON_SETUP_TYPE = setuptools
PYTHON_CYTHON_LICENSE = Apache-2.0
PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

$(eval $(host-python-package))
