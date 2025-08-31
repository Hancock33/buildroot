################################################################################
#
# python-httplib2
#
################################################################################

PYTHON_HTTPLIB2_VERSION = 0.30.0
PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/5b/75/1d10a90b3411f707c10c226fa918cf4f5e0578113caa223369130f702b6b
PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
PYTHON_HTTPLIB2_LICENSE = MIT
PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2

$(eval $(python-package))
$(eval $(host-python-package))
