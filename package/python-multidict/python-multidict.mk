################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 6.4.4
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/91/2f/a3470242707058fe856fe59241eee5635d79087100b7042a867368863a27
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

$(eval $(python-package))
