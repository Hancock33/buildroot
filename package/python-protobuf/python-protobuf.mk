################################################################################
#
# python-protobuf
#
################################################################################

PYTHON_PROTOBUF_VERSION = 6.32.1
PYTHON_PROTOBUF_SOURCE = protobuf-$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/fa/a4/cc17347aa2897568beece2e674674359f911d6fe21b0b8d6268cd42727ac
PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
PYTHON_PROTOBUF_SETUP_TYPE = setuptools

$(eval $(python-package))
