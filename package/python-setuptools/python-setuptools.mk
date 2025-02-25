################################################################################
#
# python-setuptools
#
################################################################################

PYTHON_SETUPTOOLS_VERSION = 75.8.1
PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/e8/42/0e5f75d734f181367de4acd9aba8f875453a5905169c5485ca8416b015ae
PYTHON_SETUPTOOLS_LICENSE = MIT
PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel

$(eval $(python-package))
$(eval $(host-python-package))
