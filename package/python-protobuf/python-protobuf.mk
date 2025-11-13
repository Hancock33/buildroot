################################################################################
#
# python-protobuf
#
################################################################################

PYTHON_PROTOBUF_VERSION = 6.33.1
PYTHON_PROTOBUF_SOURCE = protobuf-$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/0a/03/a1440979a3f74f16cab3b75b0da1a1a7f922d56a8ddea96092391998edc0
PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
PYTHON_PROTOBUF_SETUP_TYPE = setuptools

$(eval $(python-package))
