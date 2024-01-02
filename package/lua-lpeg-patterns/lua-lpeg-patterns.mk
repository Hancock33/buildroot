################################################################################
#
# lua-lpeg-patterns
#
################################################################################

LUA_LPEG_PATTERNS_VERSION = v0.5
LUA_LPEG_PATTERNS_SITE = $(call github,daurnimator,lpeg_patterns,$(LUA_LPEG_PATTERNS_VERSION))
LUA_LPEG_PATTERNS_DEPENDENCIES = lua lpeg
LUA_LPEG_PATTERNS_LICENSE = MIT

define LUA_LPEG_PATTERNS_TARGET_CMDS
	mkdir -p                     $(TARGET_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/lpeg_patterns
	cp -av $(@D)/lpeg_patterns/* $(TARGET_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/lpeg_patterns
	chmod 644                    $(TARGET_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION)/lpeg_patterns
endef

$(eval $(generic-package))
