################################################################################
#
# python-calver
#
################################################################################

PYTHON_CALVER_VERSION = 2025.4.1
PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
PYTHON_CALVER_SITE = PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/51/a5/2371326892fcea6f185c0febea51139ce4f8a68a3c5d105e54cefe99637e
PYTHON_CALVER_SETUP_TYPE = setuptools
PYTHON_CALVER_LICENSE = Apache-2.0
PYTHON_CALVER_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
