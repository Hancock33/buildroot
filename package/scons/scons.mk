################################################################################
#
# scons
#
################################################################################

SCONS_VERSION = 4.9.0
SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
SCONS_SITE = https://files.pythonhosted.org/packages/61/7e/79e07dc2eb8874580934cd0c834a8a78f15d5b0d6155a424f6c7b35441c3
SCONS_LICENSE = MIT
SCONS_LICENSE_FILES = LICENSE
SCONS_SETUP_TYPE = setuptools

$(eval $(host-python-package))

# variables used by other packages
SCONS = $(HOST_DIR)/bin/python3 $(HOST_DIR)/bin/scons $(if $(QUIET),-s)
