################################################################################
#
# python-types-psutil
#
################################################################################

PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20261122
PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/af/c3/f2b13b3a78628887c407bee49eed3e8bfb5e23e2e8407c31146269226215
PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
