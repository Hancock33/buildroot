################################################################################
#
# python-calver
#
################################################################################

PYTHON_CALVER_VERSION = 2025.3.31
PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
PYTHON_CALVER_SITE = PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/58/d7/ebd18f710cedddc010cc71d89ceb00425fc373ec44311aa66ed57790432d
PYTHON_CALVER_SETUP_TYPE = setuptools
PYTHON_CALVER_LICENSE = Apache-2.0
PYTHON_CALVER_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
