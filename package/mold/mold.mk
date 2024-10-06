################################################################################
#
# mold
#
################################################################################
# Version: Commits on Oct 04, 2024
MOLD_VERSION = v2.34.1
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = MIT
MOLD_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES) tbb
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-zstd host-cmake host-tbb host-xxhash host-blake3

MOLD_SUPPORTS_IN_SOURCE_BUILD = NO
MOLD_CONF_OPTS += -DMOLD_USE_SYSTEM_TBB=ON
HOST_MOLD_CONF_OPTS += -DMOLD_USE_SYSTEM_TBB=ON
HOST_MOLD_CONF_OPTS += -DCMAKE_ASM_COMPILER="gcc"
HOST_MOLD_CONF_OPTS += -DMOLD_MOSTLY_STATIC=ON

define MOLD_INSTALL
    rm -rf $(HOST_DIR)/bin/mold.ld
    rm -rf $(HOST_DIR)/bin/ld.mold
    mkdir -p                                                         $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
    cp -av $(HOST_DIR)/bin/mold                                      $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.mold
    mv     $(HOST_DIR)/bin/mold                                      $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
    ln -sf $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold                $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
endef

HOST_MOLD_POST_INSTALL_HOOKS += MOLD_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
