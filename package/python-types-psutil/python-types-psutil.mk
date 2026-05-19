################################################################################
#
# python-types-psutil
#
################################################################################

PYTHON_TYPES_PSUTIL_VERSION = 7.2.2.20260518
PYTHON_TYPES_PSUTIL_SOURCE = types_psutil-$(PYTHON_TYPES_PSUTIL_VERSION).tar.gz
PYTHON_TYPES_PSUTIL_SITE = https://files.pythonhosted.org/packages/cb/f1/6901857281d4e8d792492e1495eef6f4f01318a3b6a066486d81000a4511
PYTHON_TYPES_PSUTIL_SETUP_TYPE = setuptools
PYTHON_TYPES_PSUTIL_LICENSE = Apache-2.0
PYTHON_TYPES_PSUTIL_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
