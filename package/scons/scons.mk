################################################################################
#
# scons
#
################################################################################

SCONS_VERSION = 4.9.1
SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
SCONS_SITE = https://files.pythonhosted.org/packages/c8/c1/30176c76c1ef723fab62e5cdb15d3c972427a146cb6f868748613d7b25af
SCONS_LICENSE = MIT
SCONS_LICENSE_FILES = LICENSE
SCONS_SETUP_TYPE = setuptools

$(eval $(host-python-package))

# variables used by other packages
SCONS = $(HOST_DIR)/bin/python3 $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
