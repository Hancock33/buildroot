################################################################################
#
# python-trove-classifiers
#
################################################################################

PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.3.3.18
PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
https://files.pythonhosted.org/packages/08/e9/eb59303bac7aca949c4a4b0fa03a9b270be165d303a84cf2733d35a840ce
PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
HOST_PYTHON_TROVE_CLASSIFIERS_DEPENDENCIES = host-python-calver

$(eval $(host-python-package))
