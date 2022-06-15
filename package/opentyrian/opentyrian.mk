################################################################################
#
# opentyrian
#
################################################################################
# Version: Commits on Jun 04, 2022
OPENTYRIAN_VERSION = 38a6308414ed116bd7a87410c0341ab5fb21cb9b
OPENTYRIAN_SITE = $(call github,opentyrian,opentyrian,$(OPENTYRIAN_VERSION))
OPENTYRIAN_LICENSE = GPL-2.0+
OPENTYRIAN_LICENSE_FILES = COPYING

OPENTYRIAN_DEPENDENCIES = sdl2

ifeq ($(BR2_PACKAGE_OPENTYRIAN_NET),y)
OPENTYRIAN_DEPENDENCIES += sdl2_net
OPENTYRIAN_NETWORK = true
else
OPENTYRIAN_NETWORK = false
endif

define OPENTYRIAN_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) PLATFORM=UNIX \
		CC="$(TARGET_CC)" \
		STRIP="/bin/true" \
		SDL_CONFIG="$(STAGING_DIR)/usr/bin/sdl2-config" \
		LDFLAGS="$(TARGET_LDFLAGS) -lm" \
		WITH_NETWORK="$(OPENTYRIAN_NETWORK)" \
		-C $(@D)
endef

define OPENTYRIAN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/opentyrian $(TARGET_DIR)/usr/bin/opentyrian
	
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/buildroot/package/opentyrian/opentyrian.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(generic-package))
