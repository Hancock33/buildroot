################################################################################
#
# python-trove-classifiers
#
################################################################################

PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.4.28.22
PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/b0/f3/4d82f6d81391237842c4250766ae02c7a178a3a236e0fbd749ec154da17c
PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
HOST_PYTHON_TROVE_CLASSIFIERS_DEPENDENCIES = host-python-calver

$(eval $(host-python-package))
