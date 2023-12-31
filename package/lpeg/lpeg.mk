################################################################################
#
# lpeg
#
################################################################################

LPEG_VERSION = 1.1.0
LPEG_SITE = https://www.inf.puc-rio.br/~roberto/lpeg
LPEG_LICENSE = MIT
LPEG_DEPENDENCIES = lua
LPEG_INSTALL_STAGING = YES

define LPEG_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f makefile LUADIR=$(STAGING_DIR)/usr/include
endef

define LPEG_INSTALL_TARGET_CMDS
	mkdir -p                      $(TARGET_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)
	mkdir -p                      $(TARGET_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)
	install -Dm0755 $(@D)/lpeg.so $(TARGET_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/lpeg.so
	install -Dm0755 $(@D)/re.lua  $(TARGET_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/re.lua
endef

define LPEG_INSTALL_STAGING_CMDS
	mkdir -p                      $(STAGING_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)
	mkdir -p                      $(STAGING_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)
	install -Dm0755 $(@D)/lpeg.so $(STAGING_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/lpeg.so
	install -Dm0755 $(@D)/re.lua  $(STAGING_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/re.lua
endef

$(eval $(generic-package))
