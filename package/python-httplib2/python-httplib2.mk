################################################################################
#
# python-httplib2
#
################################################################################

PYTHON_HTTPLIB2_VERSION = 0.30.2
PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/b5/3f/9885ad4999af31bc19baf6f998264c2bda94dd8729bc13f0759fdf20ab8b
PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
PYTHON_HTTPLIB2_LICENSE = MIT
PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
PYTHON_HTTPLIB2_CPE_ID_VENDOR = httplib2_project
PYTHON_HTTPLIB2_CPE_ID_PRODUCT = httplib2

$(eval $(python-package))
$(eval $(host-python-package))
