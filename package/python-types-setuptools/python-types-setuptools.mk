################################################################################
#
# python-types-setuptools
#
################################################################################

PYTHON_TYPES_SETUPTOOLS_VERSION = 82.0.0.20260402
PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/e9/f8/74f8a76b4311e70772c0df8f2d432040a3b0facd7bcce6b72b0b26e1746b
PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
