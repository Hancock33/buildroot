################################################################################
#
# python-cython
#
################################################################################

PYTHON_CYTHON_VERSION = 3.2.2
PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/29/17/55fc687ba986f2210298fa2f60fec265fa3004c3f9a1e958ea1fe2d4e061
PYTHON_CYTHON_SETUP_TYPE = setuptools
PYTHON_CYTHON_LICENSE = Apache-2.0
PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt

$(eval $(host-python-package))
