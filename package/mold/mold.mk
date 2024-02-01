################################################################################
#
# mold
#
################################################################################
# Version: Commits on Feb 01, 2024
MOLD_VERSION = 25351379ab5e02cd050c82e1524635ac16f4c306
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = MIT
MOLD_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES) tbb
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-zstd host-cmake host-tbb

MOLD_SUPPORTS_IN_SOURCE_BUILD = NO
MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DMOLD_USE_SYSTEM_TBB=ON
HOST_MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release -DMOLD_USE_SYSTEM_TBB=ON
HOST_MOLD_CONF_OPTS += -DCMAKE_ASM_COMPILER="gcc" -DMOLD_MOSTLY_STATIC=ON

define MOLD_INSTALL
    rm -rf $(HOST_DIR)/bin/mold.ld
    rm -rf $(HOST_DIR)/bin/ld.mold
    mkdir -p                                                         $(HOST_DIR)/$(GNU_TARGET_NAME)/bin
    cp -av $(HOST_DIR)/bin/mold                                      $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.mold
    mv     $(HOST_DIR)/bin/mold                                      $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
    ln -sf $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold                $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
    cp -av $(@D)//buildroot-build/third-party/blake3/c/libblake3.so* $(HOST_DIR)/lib
endef

HOST_MOLD_POST_INSTALL_HOOKS += MOLD_INSTALL

$(eval $(cmake-package))
$(eval $(host-cmake-package))
