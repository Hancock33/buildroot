################################################################################
#
# python-aiohttp
#
################################################################################

PYTHON_AIOHTTP_VERSION = 3.10.8
PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/4e/05/da5ff89c85444a6ade9079e73580fb3f78c6ba0e170a2472f15400d03e02
PYTHON_AIOHTTP_SETUP_TYPE = setuptools
PYTHON_AIOHTTP_LICENSE = Apache-2.0
PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp

$(eval $(python-package))
