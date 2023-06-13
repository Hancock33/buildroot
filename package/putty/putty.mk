################################################################################
#
# putty
#
################################################################################

PUTTY_VERSION = 0.78
PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
PUTTY_LICENSE = MIT
PUTTY_LICENSE_FILES = LICENCE
PUTTY_CPE_ID_VENDOR = putty

ifeq ($(BR2_PACKAGE_LIBGTK2),y)
PUTTY_DEPENDENCIES += host-pkgconf libgtk2
endif

$(eval $(cmake-package))
