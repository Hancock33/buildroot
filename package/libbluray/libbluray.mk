################################################################################
#
# libbluray
#
################################################################################

LIBBLURAY_VERSION = 1.4.0
LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.xz
LIBBLURAY_INSTALL_STAGING = YES
LIBBLURAY_LICENSE = LGPL-2.1+
LIBBLURAY_LICENSE_FILES = COPYING
LIBBLURAY_CPE_ID_VENDOR = videolan
LIBBLURAY_DEPENDENCIES = host-pkgconf

LIBBLURAY_CONF_OPTS = -Dbdj_jar=disabled

ifeq ($(BR2_PACKAGE_LIBICONV),y)
LIBBLURAY_DEPENDENCIES += libiconv
endif

ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
LIBBLURAY_DEPENDENCIES += libudfread
endif

ifeq ($(BR2_PACKAGE_FREETYPE),y)
LIBBLURAY_DEPENDENCIES += freetype
LIBBLURAY_CONF_OPTS += -Dfreetype=enabled
else
LIBBLURAY_CONF_OPTS += -Dfreetype=disabled
endif

ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
LIBBLURAY_DEPENDENCIES += fontconfig
LIBBLURAY_CONF_OPTS += -Dfontconfig=enabled
else
LIBBLURAY_CONF_OPTS += -Dfontconfig=disabled
endif

ifeq ($(BR2_PACKAGE_LIBXML2),y)
LIBBLURAY_DEPENDENCIES += libxml2
LIBBLURAY_CONF_OPTS += -Dlibxml2=enabled
else
LIBBLURAY_CONF_OPTS += -Dlibxml2=disabled
endif

$(eval $(meson-package))
