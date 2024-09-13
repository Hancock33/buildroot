################################################################################
#
# python-pyproject-hooks
#
################################################################################

PYTHON_PYPROJECT_HOOKS_VERSION = 1.1.0
PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/c7/07/6f63dda440d4abb191b91dc383b472dae3dd9f37e4c1e4a5c3db150531c6
PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE

$(eval $(host-python-package))
