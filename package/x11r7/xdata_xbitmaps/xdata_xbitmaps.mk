################################################################################
#
# xdata_xbitmaps
#
################################################################################

XDATA_XBITMAPS_VERSION = 1.1.4
XDATA_XBITMAPS_SOURCE = xbitmaps-$(XDATA_XBITMAPS_VERSION).tar.xz
XDATA_XBITMAPS_SITE = https://xorg.freedesktop.org/archive/individual/data
XDATA_XBITMAPS_LICENSE = MIT
XDATA_XBITMAPS_LICENSE_FILES = COPYING

XDATA_XBITMAPS_INSTALL_STAGING = YES

$(eval $(meson-package))
