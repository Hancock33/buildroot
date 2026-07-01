################################################################################
#
# python-pypa-build
#
################################################################################

PYTHON_PYPA_BUILD_VERSION = 1.5.0
PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/78/e0/df5e171f685f82f37b12e1f208064e24244911079d7b767447d1af7e0d70
PYTHON_PYPA_BUILD_LICENSE = MIT
PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
	host-python-packaging \
	host-python-pyproject-hooks

$(eval $(host-python-package))
