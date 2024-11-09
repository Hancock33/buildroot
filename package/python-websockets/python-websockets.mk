################################################################################
#
# python-websockets
#
################################################################################

PYTHON_WEBSOCKETS_VERSION = 14.0
PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/d5/95/9ec3ef89770eaf437ec3a6aa18d07aa29215419009e3330fd1031ff2f162
PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE

$(eval $(python-package))
