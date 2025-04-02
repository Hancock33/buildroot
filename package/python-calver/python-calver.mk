################################################################################
#
# python-calver
#
################################################################################

PYTHON_CALVER_VERSION = 2025.4.2
PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/ee/28/c6c465ab2ce1882eb1ba8e0f173c1613f509eba3c60eb916fcb9b704238c
PYTHON_CALVER_SETUP_TYPE = setuptools
PYTHON_CALVER_LICENSE = Apache-2.0
PYTHON_CALVER_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
