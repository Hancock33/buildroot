################################################################################
#
# opentyrian
#
################################################################################
# Version: Commits on Aug 02, 2024
OPENTYRIAN_VERSION = ebc4f191f409549d54b09887ebb87333f9dadd42
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
endef

$(eval $(generic-package))
