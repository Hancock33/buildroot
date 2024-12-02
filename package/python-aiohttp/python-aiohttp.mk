################################################################################
#
# python-aiohttp
#
################################################################################

PYTHON_AIOHTTP_VERSION = 3.11.9
PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/3f/24/d5c0aed3ed90896f8505786e3a1e348fd9c61284ef21f54ee9cdf8b92e4f
PYTHON_AIOHTTP_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_LICENSE = Apache-2.0
PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp

$(eval $(python-package))
