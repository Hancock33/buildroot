################################################################################
#
# python-protobuf
#
################################################################################

PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
PYTHON_PROTOBUF_SOURCE = protobuf-5.$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/d2/4f/1639b7b1633d8fd55f216ba01e21bf2c43384ab25ef3ddb35d85a52033e8
PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
PYTHON_PROTOBUF_SETUP_TYPE = setuptools

$(eval $(python-package))
