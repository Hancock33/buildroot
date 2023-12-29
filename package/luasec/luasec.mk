################################################################################
#
# luasec
#
################################################################################

LUASEC_VERSION = v1.3.2
LUASEC_SITE = $(call github,lunarmodules,luasec,$(LUASEC_VERSION))
LUASEC_LICENSE = MIT
LUASEC_DEPENDENCIES = openssl

define LUASEC_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ \
	LIB_PATH=-L$(STAGING_DIR)/usr/lib INC_PATH=$(STAGING_DIR)/usr/include linux
endef

define LUASEC_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ \
	LIB_PATH=-L$(STAGING_DIR)/usr/lib INC_PATH=$(STAGING_DIR)/usr/include \
	LUAPATH=$(TARGET_DIR)/usr/share/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION) \
	LUACPATH=$(TARGET_DIR)/usr/lib/lua/$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION) \
	linux install
endef

$(eval $(generic-package))
