################################################################################
#
# python-psutil
#
################################################################################

PYTHON_PSUTIL_VERSION = 7.1.1
PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/89/fc/889242351a932d6183eec5df1fc6539b6f36b6a88444f1e63f18668253aa
PYTHON_PSUTIL_SETUP_TYPE = setuptools
PYTHON_PSUTIL_LICENSE = BSD-3-Clause
PYTHON_PSUTIL_LICENSE_FILES = LICENSE
PYTHON_PSUTIL_CPE_ID_VENDOR = psutil_project
PYTHON_PSUTIL_CPE_ID_PRODUCT = psutil

$(eval $(python-package))
$(eval $(host-python-package))
