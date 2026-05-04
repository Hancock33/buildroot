################################################################################
#
# python-poetry-core
#
################################################################################

PYTHON_POETRY_CORE_VERSION = 2.4.0
PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/b0/97/f7bb55470bb7890d9b3d3f9fa761083d5c9a6838b17c94a41bf2939f89ef
PYTHON_POETRY_CORE_SETUP_TYPE = pep517
PYTHON_POETRY_CORE_LICENSE = MIT
PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
