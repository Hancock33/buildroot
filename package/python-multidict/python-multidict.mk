################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 6.9.0
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/e7/59/84b6cad9ddfdd9471db727b0e987c60ecbdb6b206ba265e8c50e74a1ab80
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

$(eval $(python-package))
