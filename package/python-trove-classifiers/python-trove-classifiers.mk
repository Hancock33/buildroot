################################################################################
#
# python-trove-classifiers
#
################################################################################

PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.5.1.12
PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/dc/81/a43db75173e49b1204d2a826b2a3a0e2dee45fb0d9abfac2ce1ff928eebf
PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
HOST_PYTHON_TROVE_CLASSIFIERS_DEPENDENCIES = host-python-calver

$(eval $(host-python-package))
