################################################################################
#
# freetype
#
################################################################################

FREETYPE_VERSION = 2.14.3
FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
FREETYPE_INSTALL_STAGING = YES
FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
FREETYPE_LICENSE = FTL or GPL-2.0+
FREETYPE_LICENSE_FILES = LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
FREETYPE_CPE_ID_VENDOR = freetype
FREETYPE_DEPENDENCIES = host-pkgconf

# harfbuzz already depends on freetype so disable harfbuzz in freetype to avoid
# a circular dependency
FREETYPE_CONF_OPTS = -Dharfbuzz=disabled

HOST_FREETYPE_DEPENDENCIES = host-pkgconf
HOST_FREETYPE_CONF_OPTS = \
	-Dbrotli=disabled \
	-Dbzip2=disabled \
	-Dharfbuzz=disabled \
	-Dpng=disabled \
	-Dzlib=disabled

ifeq ($(BR2_PACKAGE_ZLIB),y)
FREETYPE_DEPENDENCIES += zlib
FREETYPE_CONF_OPTS += -Dzlib=enabled
else
FREETYPE_CONF_OPTS += -Dzlib=disabled
endif

ifeq ($(BR2_PACKAGE_BROTLI),y)
FREETYPE_DEPENDENCIES += brotli
FREETYPE_CONF_OPTS += -Dbrotli=enabled
else
FREETYPE_CONF_OPTS += -Dbrotli=disabled
endif

ifeq ($(BR2_PACKAGE_BZIP2),y)
FREETYPE_DEPENDENCIES += bzip2
FREETYPE_CONF_OPTS += -Dbzip2=enabled
else
FREETYPE_CONF_OPTS += -Dbzip2=disabled
endif

ifeq ($(BR2_PACKAGE_LIBPNG),y)
FREETYPE_DEPENDENCIES += libpng
FREETYPE_CONF_OPTS += -Dpng=enabled
else
FREETYPE_CONF_OPTS += -Dpng=disabled
endif

$(eval $(meson-package))
$(eval $(host-meson-package))
