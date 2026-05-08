################################################################################
#
# python-types-psutil
#
################################################################################

PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260508
PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/70/cc/5ac56357b08655ff93106d6391b72d50c47416a044041312550bcd806827
PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
