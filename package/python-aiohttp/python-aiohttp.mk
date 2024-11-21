################################################################################
#
# python-aiohttp
#
################################################################################

PYTHON_AIOHTTP_VERSION = 3.11.6
PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/d5/66/a967a2e9ceab12b6970ca5be3bccc9cf13fed4acfabe2c66de3d75599185
PYTHON_AIOHTTP_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_LICENSE = Apache-2.0
PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp

$(eval $(python-package))
