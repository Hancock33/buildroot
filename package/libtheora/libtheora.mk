################################################################################
#
# libtheora
#
################################################################################

LIBTHEORA_VERSION = v1.2.0alpha1-148-g7180717276af1ebc7da15c83162d6c5d6203aabf
LIBTHEORA_SITE = $(call github,xiph,theora,$(LIBTHEORA_VERSION))
LIBTHEORA_INSTALL_STAGING = YES
# We're patching Makefile.am
LIBTHEORA_AUTORECONF = YES
LIBTHEORA_LICENSE = BSD-3-Clause
LIBTHEORA_LICENSE_FILES = COPYING LICENSE

LIBTHEORA_CONF_OPTS = \
	--disable-oggtest \
	--disable-vorbistest \
	--disable-sdltest \
	--disable-examples \
	--disable-spec

LIBTHEORA_DEPENDENCIES = libogg libvorbis host-pkgconf

$(eval $(autotools-package))
