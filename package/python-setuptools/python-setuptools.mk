################################################################################
#
# python-setuptools
#
################################################################################

PYTHON_SETUPTOOLS_VERSION = 76.1.0
PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fa/2b/287ade3a580869e6178cb37d045f54272b1f006f2c0ff6fad08db258d027
PYTHON_SETUPTOOLS_LICENSE = MIT
PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel

$(eval $(python-package))
$(eval $(host-python-package))
