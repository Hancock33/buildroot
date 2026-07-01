################################################################################
#
# python-hatchling
#
################################################################################

PYTHON_HATCHLING_VERSION = 1.30.1
PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/63/4c/8717ccb844b4fa5a5ba6352e97d743ed24e9a22cf90b7c109c17030a46a1
PYTHON_HATCHLING_LICENSE = MIT
PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
PYTHON_HATCHLING_SETUP_TYPE = pep517
HOST_PYTHON_HATCHLING_DEPENDENCIES = \
	host-python-packaging \
	host-python-pathspec \
	host-python-pluggy \
	host-python-trove-classifiers

$(eval $(host-python-package))
