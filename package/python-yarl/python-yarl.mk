################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.20.0
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/62/51/c0edba5219027f6eab262e139f73e2417b0f4efffa23bf562f6e18f76ca5
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools
PYTHON_YARL_DEPENDENCIES = \
	host-python-cython \
	host-python-expandvars

$(eval $(python-package))
