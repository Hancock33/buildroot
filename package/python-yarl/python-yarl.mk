################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.15.3
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/5e/f5/ea4447f08264c84c1fa549b3b481640091b28692866becdd2255dbc4f6cd
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools

$(eval $(python-package))
