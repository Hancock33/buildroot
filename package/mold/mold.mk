################################################################################
#
# mold
#
################################################################################
# Version: Commits on Mar 01, 2024
MOLD_VERSION = c6e5e2c0a0af04bf23b07435453b88311c13c499
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = MIT
MOLD_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES) tbb
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-zstd host-cmake host-tbb

MOLD_SUPPORTS_IN_SOURCE_BUILD = NO
MOLD_CONF_OPTS += -DMOLD_USE_SYSTEM_TBB=ON
HOST_MOLD_CONF_OPTS += -DMOLD_USE_SYSTEM_TBB=ON
HOST_MOLD_CONF_OPTS += -DCMAKE_ASM_COMPILER="gcc"
HOST_MOLD_CONF_OPTS += -DMOLD_MOSTLY_STATIC=ON
HOST_MOLD_CONF_OPTS += -DMOLD_LTO=ON

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
