################################################################################
#
# python-packaging
#
################################################################################

PYTHON_PACKAGING_VERSION = 26.4
PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/c3/75/ffb1dc0ed12352139fb4ca0e3fde4325a23e3d0f3f40efe89717bc4f557b
PYTHON_PACKAGING_SETUP_TYPE = flit
PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
HOST_PYTHON_PACKAGING_SETUP_TYPE = flit-bootstrap

$(eval $(python-package))
$(eval $(host-python-package))
