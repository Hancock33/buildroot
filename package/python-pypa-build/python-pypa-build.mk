################################################################################
#
# python-pypa-build
#
################################################################################

PYTHON_PYPA_BUILD_VERSION = 1.4.2
PYTHON_PYPA_BUILD_SOURCE = build-$(PYTHON_PYPA_BUILD_VERSION).tar.gz
PYTHON_PYPA_BUILD_SITE = https://files.pythonhosted.org/packages/6c/1d/ab15c8ac57f4ee8778d7633bc6685f808ab414437b8644f555389cdc875e
PYTHON_PYPA_BUILD_LICENSE = MIT
PYTHON_PYPA_BUILD_LICENSE_FILES = LICENSE
PYTHON_PYPA_BUILD_SETUP_TYPE = flit-bootstrap
HOST_PYTHON_PYPA_BUILD_DEPENDENCIES = \
	host-python-packaging \
	host-python-pyproject-hooks

$(eval $(host-python-package))
