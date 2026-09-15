################################################################################
#
# python-pyproject-hooks
#
################################################################################

PYTHON_PYPROJECT_HOOKS_VERSION = 1.3.0
PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/18/94/21931ee768a9544afa6330a2e790e6ef8ce70568e88d79b15560c3054e91
PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
