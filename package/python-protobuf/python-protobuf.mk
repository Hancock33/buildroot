################################################################################
#
# python-protobuf
#
################################################################################

PYTHON_PROTOBUF_VERSION = 6.33.0
PYTHON_PROTOBUF_SOURCE = protobuf-$(PYTHON_PROTOBUF_VERSION).tar.gz
PYTHON_PROTOBUF_SITE = https://files.pythonhosted.org/packages/19/ff/64a6c8f420818bb873713988ca5492cba3a7946be57e027ac63495157d97
PYTHON_PROTOBUF_LICENSE = BSD-3-Clause
PYTHON_PROTOBUF_LICENSE_FILES = LICENSE
PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
PYTHON_PROTOBUF_SETUP_TYPE = setuptools

$(eval $(python-package))
