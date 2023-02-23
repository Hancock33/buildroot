################################################################################
#
# mold
#
################################################################################
# Version: Commits on Feb 22, 2023
MOLD_VERSION = 0870078ed256e3158b4ee57caa1e82f2f07ace25
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = GPLv3
MOLD_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-openssl host-zstd

MOLD_SUPPORTS_IN_SOURCE_BUILD = NO
MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
HOST_MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define MOLD_INSTALL
    rm -rf $(HOST_DIR)/bin/mold.ld
 	mv     $(HOST_DIR)/bin/mold                       $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
	ln -sf $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
endef

HOST_MOLD_POST_INSTALL_HOOKS += MOLD_INSTALL


$(eval $(cmake-package))
$(eval $(host-cmake-package))
