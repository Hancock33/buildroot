################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.18.0
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/5e/4b/53db4ecad4d54535aff3dfda1f00d6363d79455f62b11b8ca97b82746bd2
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools
PYTHON_YARL_DEPENDENCIES = \
	host-python-cython \
	host-python-expandvars

$(eval $(python-package))
