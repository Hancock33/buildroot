################################################################################
#
# menu-cache
#
################################################################################

MENU_CACHE_VERSION = 1.1.1
MENU_CACHE_SITE = $(call github,lxde,menu-cache,$(MENU_CACHE_VERSION))
MENU_CACHE_DEPENDENCIES = libfm-extra libglib2
MENU_CACHE_LICENSE = LGPL-2.1
MENU_CACHE_LICENSE_FILES = COPYING
MENU_CACHE_INSTALL_STAGING = YES

define MENU_CACHE_AUTOCONFIG
	cd $(@D) && ./autogen.sh
endef
MENU_CACHE_PRE_CONFIGURE_HOOKS += MENU_CACHE_AUTOCONFIG

$(eval $(autotools-package))
