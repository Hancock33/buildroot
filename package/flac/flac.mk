################################################################################
#
# flac
#
################################################################################

FLAC_VERSION = 1.5.0
FLAC_SITE = https://ftp.osuosl.org/pub/xiph/releases/flac
FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
FLAC_INSTALL_STAGING = YES
FLAC_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
FLAC_LICENSE = Xiph BSD-like (libFLAC), GPL-2.0+ (tools), LGPL-2.1+ (other libraries)
FLAC_LICENSE_FILES = COPYING.Xiph COPYING.GPL COPYING.LGPL
FLAC_CPE_ID_VALID = YES

FLAC_CONF_OPTS = \
	$(if $(BR2_INSTALL_LIBSTDCPP),-DBUILD_CXXLIBS=ON,-DBUILD_CXXLIBS=OFF)

ifeq ($(BR2_PACKAGE_LIBOGG),y)
FLAC_CONF_OPTS += -DWITH_OGG=ON
FLAC_DEPENDENCIES += libogg
else
FLAC_CONF_OPTS += -DWITH_OGG=OFF
endif

$(eval $(cmake-package))
