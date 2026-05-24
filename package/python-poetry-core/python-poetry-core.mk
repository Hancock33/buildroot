################################################################################
#
# python-poetry-core
#
################################################################################

PYTHON_POETRY_CORE_VERSION = 2.4.1
PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/b2/f2/fa88c58efb9a737c7e0e40e470edd0973fe33f0f277d24dcf17454b50974
PYTHON_POETRY_CORE_SETUP_TYPE = poetry
PYTHON_POETRY_CORE_LICENSE = MIT
PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
