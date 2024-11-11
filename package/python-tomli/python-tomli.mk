################################################################################
#
# python-tomli
#
################################################################################

PYTHON_TOMLI_VERSION = 2.1.0
PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/1e/e4/1b6cbcc82d8832dd0ce34767d5c560df8a3547ad8cbc427f34601415930a
PYTHON_TOMLI_SETUP_TYPE = flit
PYTHON_TOMLI_LICENSE = MIT
PYTHON_TOMLI_LICENSE_FILES = LICENSE

$(eval $(python-package))
$(eval $(host-python-package))
