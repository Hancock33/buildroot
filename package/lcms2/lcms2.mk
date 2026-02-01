################################################################################
#
# lcms2
#
################################################################################

LCMS2_VERSION = 2.18
LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
LCMS2_LICENSE = MIT
LCMS2_LICENSE_FILES = LICENSE
LCMS2_CPE_ID_VENDOR = littlecms
LCMS2_CPE_ID_PRODUCT = little_cms
LCMS2_INSTALL_STAGING = YES

LCMS2_CONF_OPTS = -Dtests=disabled

# tiff is only used by tificc sample
LCMS2_CONF_OPTS = -Dtiff=disabled

ifeq ($(BR2_PACKAGE_JPEG),y)
LCMS2_CONF_OPTS += -Djpeg=enabled
LCMS2_DEPENDENCIES += jpeg
else
LCMS2_CONF_OPTS += -Djpeg=disabled
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
LCMS2_DEPENDENCIES += zlib
endif

$(eval $(meson-package))
$(eval $(host-meson-package))
