################################################################################
#
# python-httplib2
#
################################################################################

PYTHON_HTTPLIB2_VERSION = 0.31.1
PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/77/df/6eb1d485a513776bbdbb1c919b72e59b5acc51c5e7ef28ad1cd444e252a3
PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
PYTHON_HTTPLIB2_LICENSE = MIT
PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2

$(eval $(python-package))
$(eval $(host-python-package))
