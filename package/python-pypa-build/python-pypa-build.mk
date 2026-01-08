################################################################################
#
# python-pypa-build
#
################################################################################

PYTHON_PYPA_BUILD_VERSION = 1.4.0
PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/42/18/94eaffda7b329535d91f00fe605ab1f1e5cd68b2074d03f255c7d250687d
PYTHON_PYPA_BUILD_LICENSE = MIT
PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
	host-python-packaging \
	host-python-pyproject-hooks

$(eval $(host-python-package))
