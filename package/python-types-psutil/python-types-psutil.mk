################################################################################
#
# python-types-psutil
#
################################################################################

PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260827
PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/89/ea/23a949b56d3a226a142b43c5c32404fae7044400296d18e8eda63d5d03a4
PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
