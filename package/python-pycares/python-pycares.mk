################################################################################
#
# python-pycares
#
################################################################################

PYTHON_PYCARES_VERSION = 4.7.0
PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/9d/cd/dabe7fb5fd0089a1a37ae94e30b2fb094bff098492f1fbdfd8e2969d69a6
PYTHON_PYCARES_SETUP_TYPE = setuptools
PYTHON_PYCARES_LICENSE = MIT
PYTHON_PYCARES_LICENSE_FILES = LICENSE
PYTHON_PYCARES_DEPENDENCIES = host-python-cffi

$(eval $(python-package))
