################################################################################
#
# python-setuptools
#
################################################################################

PYTHON_SETUPTOOLS_VERSION = 78.1.1
PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/81/9c/42314ee079a3e9c24b27515f9fbc7a3c1d29992c33451779011c74488375
PYTHON_SETUPTOOLS_LICENSE = MIT
PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
PYTHON_SETUPTOOLS_CPE_ID_PRODUCT = setuptools
PYTHON_SETUPTOOLS_SETUP_TYPE = pep517
PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel
HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python-wheel

$(eval $(python-package))
$(eval $(host-python-package))
