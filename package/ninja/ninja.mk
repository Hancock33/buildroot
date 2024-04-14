################################################################################
#
# ninja
#
################################################################################

NINJA_VERSION = 1.12.0
NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
NINJA_LICENSE = Apache-2.0
NINJA_LICENSE_FILES = COPYING
NINJA_CMAKE_BACKEND = make

HOST_NINJA_CONF_OPTS += -DCMAKE_C_COMPILER_LAUNCHER=""
HOST_NINJA_CONF_OPTS += -DCMAKE_CXX_COMPILER_LAUNCHER=""

define HOST_NINJA_INSTALL_CMDS
	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
endef

$(eval $(host-cmake-package))
