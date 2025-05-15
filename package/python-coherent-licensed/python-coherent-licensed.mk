################################################################################
#
# python-coherent-licensed
#
################################################################################

PYTHON_COHERENT_LICENSED_VERSION = 0.2.0
PYTHON_COHERENT_LICENSED_SOURCE = coherent_licensed-$(PYTHON_COHERENT_LICENSED_VERSION).tar.gz
PYTHON_COHERENT_LICENSED_SITE = https://files.pythonhosted.org/packages/87/6e/339f698e3de95a2019377c43c2525db2001d0534e9f9d5b217eb74863c90
PYTHON_COHERENT_LICENSED_LICENSE = BSD-3-Clause
PYTHON_COHERENT_LICENSED_LICENSE_FILES = LICENSE
PYTHON_COHERENT_LICENSED_DEPENDENCIES = host-protobuf
PYTHON_COHERENT_LICENSED_SETUP_TYPE = setuptools

$(eval $(python-package))
$(eval $(host-python-package))
