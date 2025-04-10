################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 6.4.2
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/79/f2/5e10ba356eddf43b85b67df6fdd07dce882cc8479cfe434e97cc72603ac9
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

$(eval $(python-package))
