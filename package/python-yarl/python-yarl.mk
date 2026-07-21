################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.24.5
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/31/33/ebe9e3d1f86c7a0b51094c0a146392045ca1631d2664889539dec8088a33
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools
PYTHON_YARL_DEPENDENCIES = \
	host-python-cython \
	host-python-expandvars

$(eval $(python-package))
