################################################################################
#
# python-scikit-build-core
#
################################################################################

PYTHON_SCIKIT_BUILD_CORE_VERSION = 0.11.6
PYTHON_SCIKIT_BUILD_CORE_SOURCE = scikit_build_core-$(PYTHON_SCIKIT_BUILD_CORE_VERSION).tar.gz
PYTHON_SCIKIT_BUILD_CORE_SITE = https://files.pythonhosted.org/packages/48/b2/c11aaa746f3dfcdb46499affbc5f9784c991d354a80ca92f96a0f0f5aadf
PYTHON_SCIKIT_BUILD_CORE_SETUP_TYPE = hatch
PYTHON_SCIKIT_BUILD_CORE_LICENSE = BSD-3-Clause, MIT, Apache-2.0, BSD-3-Clause-LBNL
PYTHON_SCIKIT_BUILD_CORE_LICENSE_FILES = LICENSE
HOST_PYTHON_SCIKIT_BUILD_CORE_DEPENDENCIES = host-python-hatch-vcs

$(eval $(host-python-package))
