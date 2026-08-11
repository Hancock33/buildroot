################################################################################
#
# scons
#
################################################################################

SCONS_VERSION = 4.11.0
SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
SCONS_SITE = https://files.pythonhosted.org/packages/dd/82/3c4e089ac8df2eaee8a7f14e489b2a76f94f4c1d8defa4e46c8ad15cae86
SCONS_LICENSE = MIT
SCONS_LICENSE_FILES = LICENSE
SCONS_SETUP_TYPE = setuptools

$(eval $(host-python-package))

# variables used by other packages
SCONS = $(HOST_DIR)/bin/python3 $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
