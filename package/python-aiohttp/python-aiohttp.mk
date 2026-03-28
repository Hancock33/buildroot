################################################################################
#
# python-aiohttp
#
################################################################################

PYTHON_AIOHTTP_VERSION = 3.13.4
PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/45/4a/064321452809dae953c1ed6e017504e72551a26b6f5708a5a80e4bf556ff
PYTHON_AIOHTTP_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_DEPENDENCIES = host-python-pkgconfig
PYTHON_AIOHTTP_LICENSE = Apache-2.0
PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp

PYTHON_AIOHTTP_DEPENDENCIES = host-python-pkgconfig

$(eval $(python-package))
