################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.11.1
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/e4/3d/4924f9ed49698bac5f112bc9b40aa007bbdcd702462c1df3d2e1383fb158
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools

$(eval $(python-package))
