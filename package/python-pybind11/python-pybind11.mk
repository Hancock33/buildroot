################################################################################
#
# python-pybind11
#
################################################################################

PYTHON_PYBIND11_VERSION = 3.0.1
PYTHON_PYBIND11_SOURCE = pybind11-$(PYTHON_PYBIND11_VERSION).tar.gz
PYTHON_PYBIND11_SITE = https://files.pythonhosted.org/packages/2f/7b/a6d8dcb83c457e24a9df1e4d8fd5fb8034d4bbc62f3c324681e8a9ba57c2
PYTHON_PYBIND11_SETUP_TYPE = pep517
PYTHON_PYBIND11_LICENSE = BSD-3-Clause
PYTHON_PYBIND11_LICENSE_FILES = LICENSE
HOST_PYTHON_PYBIND11_DEPENDENCIES = host-python-scikit-build-core

$(eval $(host-python-package))
