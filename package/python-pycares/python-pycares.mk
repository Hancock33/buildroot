################################################################################
#
# python-pycares
#
################################################################################

PYTHON_PYCARES_VERSION = 4.6.1
PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/47/2e/1fab7f91820c788a3d236f8fe25a1ea6c4f51b728fb11d3c05d02e04a5d4
PYTHON_PYCARES_SETUP_TYPE = setuptools
PYTHON_PYCARES_LICENSE = MIT
PYTHON_PYCARES_LICENSE_FILES = LICENSE
PYTHON_PYCARES_DEPENDENCIES = host-python-cffi

$(eval $(python-package))
