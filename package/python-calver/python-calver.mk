################################################################################
#
# python-calver
#
################################################################################

PYTHON_CALVER_VERSION = 2025.4.17
PYTHON_CALVER_SOURCE = calver-$(PYTHON_CALVER_VERSION).tar.gz
PYTHON_CALVER_SITE = https://files.pythonhosted.org/packages/4f/1e/6cdde2a9cbd1bd2fad6fab0d005b1c10b4161823656ddb19ccc3adcbd5af
PYTHON_CALVER_SETUP_TYPE = setuptools
PYTHON_CALVER_LICENSE = Apache-2.0
PYTHON_CALVER_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
