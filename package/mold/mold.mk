################################################################################
#
# mold
#
################################################################################
# Version: Commits on Feb 21, 2023
MOLD_VERSION = 5ae8ec966963b1725dee3178e42a4c5d54babc59
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = GPLv3
MOLD_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-openssl host-zstd

MOLD_SUPPORTS_IN_SOURCE_BUILD = NO
MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DMOLD_LTO=ON
HOST_MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release

define MOLD_INSTALL
    rm -rf $(HOST_DIR)/bin/mold.ld
 	mv     $(HOST_DIR)/bin/mold                       $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
	ln -sf $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
endef

HOST_MOLD_POST_INSTALL_HOOKS += MOLD_INSTALL


$(eval $(cmake-package))
$(eval $(host-cmake-package))
