################################################################################
#
# python-psutil
#
################################################################################

PYTHON_PSUTIL_VERSION = 7.2.0
PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/be/7c/31d1c3ceb1260301f87565f50689dc6da3db427ece1e1e012af22abca54e
PYTHON_PSUTIL_SETUP_TYPE = setuptools
PYTHON_PSUTIL_LICENSE = BSD-3-Clause
PYTHON_PSUTIL_LICENSE_FILES = LICENSE
PYTHON_PSUTIL_CPE_ID_VENDOR = psutil_project
PYTHON_PSUTIL_CPE_ID_PRODUCT = psutil

$(eval $(python-package))
$(eval $(host-python-package))
