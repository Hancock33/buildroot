################################################################################
#
# python-tomlkit
#
################################################################################

PYTHON_TOMLKIT_VERSION = 0.15.3
PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/c9/85/4a7c68111c057a6498f5bc721ef93b388b420bb31d7020759f18a5f0c2ec
PYTHON_TOMLKIT_SETUP_TYPE = poetry
PYTHON_TOMLKIT_LICENSE = MIT
PYTHON_TOMLKIT_LICENSE_FILES = LICENSE

$(eval $(python-package))
$(eval $(host-python-package))
