################################################################################
#
# inotify-tools
#
################################################################################

INOTIFY_TOOLS_VERSION = 4.23.9.0
INOTIFY_TOOLS_SITE = $(call github,inotify-tools,inotify-tools,$(INOTIFY_TOOLS_VERSION))
INOTIFY_TOOLS_LICENSE = GPL-2.0+
INOTIFY_TOOLS_LICENSE_FILES = COPYING
INOTIFY_TOOLS_INSTALL_STAGING = YES
INOTIFY_TOOLS_AUTORECONF = YES

$(eval $(autotools-package))
