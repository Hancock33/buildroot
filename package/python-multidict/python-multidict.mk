################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 6.5.0
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/46/b5/59f27b4ce9951a4bce56b88ba5ff5159486797ab18863f2b4c1c5e8465bd
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

$(eval $(python-package))
