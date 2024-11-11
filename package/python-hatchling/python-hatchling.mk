################################################################################
#
# python-hatchling
#
################################################################################

PYTHON_HATCHLING_VERSION = 1.26.1
PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/69/f7/13ce646a3be1b2879bc6821b915b33a0fc6543518aa18e8a32ab5e1e9791
PYTHON_HATCHLING_LICENSE = MIT
PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
PYTHON_HATCHLING_SETUP_TYPE = pep517
HOST_PYTHON_HATCHLING_DEPENDENCIES = \
	host-python-packaging \
	host-python-pathspec \
	host-python-pluggy \
	host-python-trove-classifiers

$(eval $(host-python-package))
