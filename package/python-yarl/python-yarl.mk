################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.12.1
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/7f/47/ab72cdc3e44a759c76596ae034e0c60f2c2b16fa220895dc4cb1c8a6c162
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools

$(eval $(python-package))
