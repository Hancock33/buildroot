################################################################################
#
# mpv
#
################################################################################

MPV_VERSION = 0.38.0
MPV_SITE = $(call github,mpv-player,mpv,v$(MPV_VERSION))
MPV_DEPENDENCIES = \
	host-pkgconf ffmpeg libass zlib libplacebo \
	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
MPV_LICENSE = GPL-2.0+
MPV_LICENSE_FILES = LICENSE.GPL
MPV_CPE_ID_VENDOR = mpv
MPV_INSTALL_STAGING = YES

# Some of these options need testing and/or tweaks
MPV_CONF_OPTS = \
	--prefix=/usr \
	-Ddemos=false \
	-Dtests=false

$(eval $(meson-package))
