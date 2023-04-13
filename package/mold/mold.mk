################################################################################
#
# mold
#
################################################################################
# Version: Commits on Apr 02, 2023
MOLD_VERSION = 461001328bccf3b61709ee4531c6768c5280e289
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = GPLv3
MOLD_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-openssl host-zstd host-cmake

MOLD_SUPPORTS_IN_SOURCE_BUILD = NO
MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
HOST_MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define MOLD_INSTALL
    rm -rf $(HOST_DIR)/bin/mold.ld
    rm -rf $(HOST_DIR)/bin/ld.mold
 	cp -av $(HOST_DIR)/bin/mold                       $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.mold
 	mv     $(HOST_DIR)/bin/mold                       $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
	ln -sf $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
endef

HOST_MOLD_POST_INSTALL_HOOKS += MOLD_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
