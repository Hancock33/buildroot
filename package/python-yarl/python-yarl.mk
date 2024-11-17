################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.17.2
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/4b/d5/0d0481857de42a44ba4911f8010d4b361dc26487f48d5503c66a797cff48
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools
PYTHON_YARL_DEPENDENCIES = \
	host-python-cython \
	host-python-expandvars

$(eval $(python-package))
