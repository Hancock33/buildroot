################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.15.4
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/35/7f/7765096fcf00ddeebfa594b0b446851be93f22d538c4cbba61d07b37555a
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools

$(eval $(python-package))
