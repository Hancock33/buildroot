################################################################################
#
# python-yarl
#
################################################################################

PYTHON_YARL_VERSION = 1.15.1
PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/06/e1/d5427a061819c9f885f58bb0467d02a523f1aec19f9e5f9c82ce950d90d3
PYTHON_YARL_LICENSE = Apache-2.0
PYTHON_YARL_LICENSE_FILES = LICENSE
PYTHON_YARL_SETUP_TYPE = setuptools

$(eval $(python-package))
