################################################################################
#
# python-websockets
#
################################################################################

PYTHON_WEBSOCKETS_VERSION = 16.1
PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/8c/02/b9a097e1e16fee4e2fd1ec8c39f6a9c5d6257bae8fa12640caf869f54436
PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE

$(eval $(python-package))
