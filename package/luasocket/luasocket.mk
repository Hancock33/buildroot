################################################################################
#
# luasocket
#
################################################################################

LUASOCKET_VERSION = v3.1.0
LUASOCKET_SITE = $(call github,lunarmodules,luasocket,$(LUASOCKET_VERSION))
LUASOCKET_LICENSE = MIT

define LUASOCKET_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
	CC_linux="$(TARGET_CXX)" LD_linux="$(TARGET_CXX)" -C $(@D) \
	LUAPREFIX_linux=$(STAGING_DIR)/usr LUAINC_linux_base=$(STAGING_DIR)/usr/include \
	LUAV=$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION) \
	PLATS=linux
endef

define LUASOCKET_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) \
	LUAPREFIX_linux=$(TARGET_DIR)/usr LUAINC_linux_base=$(TARGET_DIR)/usr/include \
	LUAV=$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION) \
	PLATS=linux install
endef

$(eval $(generic-package))
