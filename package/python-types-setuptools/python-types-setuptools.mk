################################################################################
#
# python-types-setuptools
#
################################################################################

PYTHON_TYPES_SETUPTOOLS_VERSION = 83.0.0.20260807
PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/90/45/49789d4b7424504c99c33bcc0cbd50d84de4a905cd540f1f3eab32a04380
PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
