################################################################################
#
# inotify-tools
#
################################################################################

INOTIFY_TOOLS_VERSION = 4.26.270
INOTIFY_TOOLS_SITE = $(call github,inotify-tools,inotify-tools,$(INOTIFY_TOOLS_VERSION))
INOTIFY_TOOLS_LICENSE = GPL-2.0+
INOTIFY_TOOLS_LICENSE_FILES = COPYING
INOTIFY_TOOLS_INSTALL_STAGING = YES

define INOTIFY_TOOLS_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CARGO=$(HOST_DIR)/bin/cargo CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile
endef

define INOTIFY_TOOLS_INSTALL_STAGING_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) prefix=/usr install
endef

define INOTIFY_TOOLS_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
endef
$(eval $(generic-package))
