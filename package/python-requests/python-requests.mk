################################################################################
#
# python-requests
#
################################################################################

PYTHON_REQUESTS_VERSION = 2.34.0
PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/43/b8/7a707d60fea4c49094e40262cc0e2ca6c768cca21587e34d3f705afec47e
PYTHON_REQUESTS_SETUP_TYPE = setuptools
PYTHON_REQUESTS_LICENSE = Apache-2.0
PYTHON_REQUESTS_LICENSE_FILES = LICENSE
PYTHON_REQUESTS_CPE_ID_VENDOR = python
PYTHON_REQUESTS_CPE_ID_PRODUCT = requests
HOST_PYTHON_REQUESTS_DEPENDENCIES = \
	host-python-certifi \
	host-python-charset-normalizer \
	host-python-idna \
	host-python-urllib3

$(eval $(python-package))
$(eval $(host-python-package))
