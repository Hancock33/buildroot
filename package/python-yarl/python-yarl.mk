################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.19.0
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/fc/4d/8a8f57caccce49573e567744926f88c6ab3ca0b47a257806d1cf88584c5f
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools
PYTHON_YARL_DEPENDENCIES = \
	host-python-cython \
	host-python-expandvars

$(eval $(python-package))
