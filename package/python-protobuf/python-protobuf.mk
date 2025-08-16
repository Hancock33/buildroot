################################################################################
#
# python-protobuf
#
################################################################################

PYTHON_PROTOBUF_VERSION = 6.32.0
PYTHON_PROTOBUF_SOURCE = protobuf-$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/c0/df/fb4a8eeea482eca989b51cffd274aac2ee24e825f0bf3cbce5281fa1567b
PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
PYTHON_PROTOBUF_SETUP_TYPE = setuptools

$(eval $(python-package))
