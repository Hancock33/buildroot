################################################################################
#
# python-types-setuptools
#
################################################################################

PYTHON_TYPES_SETUPTOOLS_VERSION = 82.0.0.20260518
PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/38/bc/73c2c27e047e42f114ac50fb3bdef986c56cbdb68096f8690eeafb839a93
PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
