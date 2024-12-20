################################################################################
#
# python-protobuf
#
################################################################################

PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/a5/73/4e6295c1420a9d20c9c351db3a36109b4c9aa601916cb7c6871e3196a1ca
PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
PYTHON_PROTOBUF_SETUP_TYPE = setuptools

$(eval $(python-package))
