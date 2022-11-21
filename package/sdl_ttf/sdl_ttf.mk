################################################################################
#
# sdl_ttf
#
################################################################################

# There is unlikely to be a new SDL_ttf release for the foreseeable future:
# https://bugzilla.libsdl.org/show_bug.cgi?id=5344#c1
#
# This commit points to the SDL-1.2 branch from 25 May 2022.
SDL_IMAGE_VERSION = 633dc522f5114f6d473c910dace62e8ca27a1f7d
SDL_TTF_VERSION = 2648c22c4f9e32d05a11b32f636b1c225a1502ac
SDL_TTF_SITE = $(call github,libsdl-org,SDL_ttf,$(SDL_TTF_VERSION))
SDL_TTF_LICENSE = Zlib
SDL_TTF_LICENSE_FILES = COPYING

SDL_TTF_INSTALL_STAGING = YES
SDL_TTF_DEPENDENCIES = sdl2-compat freetype
SDL_TTF_CONF_OPTS = \
	--without-x \
	--with-freetype-prefix=$(STAGING_DIR)/usr \
	--with-sdl-prefix=$(STAGING_DIR)/usr

SDL_TTF_MAKE_OPTS = \
	INCLUDES="-I$(STAGING_DIR)/usr/include/SDL" \
	LDFLAGS="-L$(STAGING_DIR)/usr/lib"

$(eval $(autotools-package))
