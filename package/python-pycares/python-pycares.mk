################################################################################
#
# python-pycares
#
################################################################################

PYTHON_PYCARES_VERSION = 4.8.0
PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/19/7a/01ef7ce35fc1312d6c1c07f3b87f329ad6daf41bb9cd57c8f017e0b653fa
PYTHON_PYCARES_SETUP_TYPE = setuptools
PYTHON_PYCARES_LICENSE = MIT
PYTHON_PYCARES_LICENSE_FILES = LICENSE
PYTHON_PYCARES_DEPENDENCIES = host-python-cffi

$(eval $(python-package))
