################################################################################
#
# python-pycares
#
################################################################################

PYTHON_PYCARES_VERSION = 4.6.0
PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/6c/ac/05e32fe0abecf98b58cb28646d59280ebad8d79b9785ad6771fa830a458b
PYTHON_PYCARES_SETUP_TYPE = setuptools
PYTHON_PYCARES_LICENSE = MIT
PYTHON_PYCARES_LICENSE_FILES = LICENSE
PYTHON_PYCARES_DEPENDENCIES = host-python-cffi

$(eval $(python-package))
