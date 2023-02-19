################################################################################
#
# mold
#
################################################################################
# Version: Commits on Feb 19, 2023
MOLD_VERSION = e1a7590db372e3ae0c1e0b18c6dfa5e0165ed85f
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = GPLv3
MOLD_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-openssl host-zstd

MOLD_SUPPORTS_IN_SOURCE_BUILD = NO
MOLD_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
HOST_MOLD_CONF_OPTS += -DTOOLS_ONLY=ON -DSKIP_INSTALL_ALL=ON -DCMAKE_BUILD_TYPE=Release

define MOLD_INSTALL
	ln -sf $(HOST_DIR)/bin/mold $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
	ln -sf $(HOST_DIR)/bin/mold $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
endef

HOST_MOLD_POST_INSTALL_HOOKS += MOLD_INSTALL


$(eval $(cmake-package))
$(eval $(host-cmake-package))
