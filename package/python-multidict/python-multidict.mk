################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 6.5.1
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/5c/43/2d90c414d9efc4587d6e7cebae9f2c2d8001bcb4f89ed514ae837e9dcbe6
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

$(eval $(python-package))
