################################################################################
#
# python-aiohttp
#
################################################################################

PYTHON_AIOHTTP_VERSION = 3.14.0
PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ee/ab/93ce242f899b68c51b0578c027aafa791ab3614cb9345fa5d37b5f5c8e3e
PYTHON_AIOHTTP_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_DEPENDENCIES = host-python-pkgconfig
PYTHON_AIOHTTP_LICENSE = Apache-2.0
PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp

PYTHON_AIOHTTP_DEPENDENCIES = host-python-pkgconfig

$(eval $(python-package))
