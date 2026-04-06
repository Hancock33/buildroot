################################################################################
#
# python-gpiod
#
################################################################################

PYTHON_GPIOD_VERSION = 2.4.1
PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/2d/05/744b509dc7ddaaaa9becff6d7c2ec85653d0ae5f53c0a3ad1aaac91bb588
PYTHON_GPIOD_SETUP_TYPE = setuptools
PYTHON_GPIOD_LICENSE = LGPL-2.1
# The package license follows libgpiod's license but doesn't include the LICENSE text in the pypi distrobuted package again
PYTHON_GPIOD_LICENSE_FILES = LICENSE
PYTHON_GPIOD_DEPENDENCIES = libgpiod2
PYTHON_GPIOD_ENV = LINK_SYSTEM_LIBGPIOD=1

$(eval $(python-package))
