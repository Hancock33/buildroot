################################################################################
#
# luafilesystem
#
################################################################################

LUAFILESYSTEM_VERSION = ff2cbc21f1a2fd34d30c0840ff2abb0121d46131
LUAFILESYSTEM_SITE = $(call github,lunarmodules,luafilesystem,$(LUAFILESYSTEM_VERSION))
LUAFILESYSTEM_LICENSE = MIT
LUAFILESYSTEM_INSTALL_STAGING = YES

define LUAFILESYSTEM_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ \
	LUA_LIBDIR==$(STAGING_DIR)/usr/lib LUA_INC=$(STAGING_DIR)/usr PREFIX=$(STAGING_DIR)/usr
endef

define LUAFILESYSTEM_INSTALL_TARGET_CMDS
	mkdir -p                         $(TARGET_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)
	install -Dm0755 $(@D)/src/lfs.so $(TARGET_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/lfs.so
endef

define LUAFILESYSTEM_INSTALL_STAGING_CMDS
	mkdir -p                         $(STAGING_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)
	install -Dm0755 $(@D)/src/lfs.so $(STAGING_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/lfs.so
endef

$(eval $(generic-package))
