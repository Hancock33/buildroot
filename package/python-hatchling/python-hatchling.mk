################################################################################
#
# python-hatchling
#
################################################################################

PYTHON_HATCHLING_VERSION = 1.32.3
PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/62/7f/b20bd29978bec1f2ddd3bbc1cdc5829bb2dd5c1476facd8a84bfe9934c5e
PYTHON_HATCHLING_LICENSE = MIT
PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
PYTHON_HATCHLING_SETUP_TYPE = pep517
HOST_PYTHON_HATCHLING_DEPENDENCIES = \
	host-python-packaging \
	host-python-pathspec \
	host-python-pluggy \
	host-python-tomlkit \
	host-python-trove-classifiers

$(eval $(host-python-package))
