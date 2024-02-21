################################################################################
#
# giflib
#
################################################################################

GIFLIB_VERSION = 5.2.2
GIFLIB_SITE = http://downloads.sourceforge.net/project/giflib
GIFLIB_INSTALL_STAGING = YES
GIFLIB_LICENSE = MIT
GIFLIB_LICENSE_FILES = COPYING
GIFLIB_CPE_ID_VALID = YES

define GIFLIB_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define HOST_GIFLIB_BUILD_CMDS
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define GIFLIB_INSTALL_STAGING_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) \
		PREFIX=/usr install-include install-lib
endef

define GIFLIB_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
		PREFIX=/usr install-include install-lib
endef

define HOST_GIFLIB_INSTALL_CMDS
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
		PREFIX=/usr install
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
