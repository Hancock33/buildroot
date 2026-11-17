################################################################################
#
# inotify-tools
#
################################################################################

INOTIFY_TOOLS_VERSION = 4.26.285
INOTIFY_TOOLS_SITE = $(call github,inotify-tools,inotify-tools,$(INOTIFY_TOOLS_VERSION))
INOTIFY_TOOLS_LICENSE = GPL-2.0+
INOTIFY_TOOLS_LICENSE_FILES = COPYING
INOTIFY_TOOLS_INSTALL_STAGING = YES

define INOTIFY_TOOLS_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/inotifywait \
		$(STAGING_DIR)/usr/bin/inotifywait
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/inotifywatch \
		$(STAGING_DIR)/usr/bin/inotifywatch
endef

define INOTIFY_TOOLS_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/inotifywait \
		$(TARGET_DIR)/usr/bin/inotifywait
	$(INSTALL) -D -m 0755 $(@D)/target/$(RUSTC_TARGET_NAME)/release/inotifywatch \
		$(TARGET_DIR)/usr/bin/inotifywatch
endef

$(eval $(cargo-package))
