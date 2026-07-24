################################################################################
#
# python-cython
#
################################################################################

PYTHON_CYTHON_VERSION = 3.2.9
PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/f6/de/db48b8870e766cfea809986cc50c1e986c663a9ab7bafd0ac1a2512c4a26
PYTHON_CYTHON_SETUP_TYPE = setuptools
PYTHON_CYTHON_LICENSE = Apache-2.0
PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

$(eval $(host-python-package))
