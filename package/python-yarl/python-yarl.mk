################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.13.1
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/e0/11/2b8334f4192646677a2e7da435670d043f536088af943ec242f31453e5ba
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools

$(eval $(python-package))
