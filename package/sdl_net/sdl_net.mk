################################################################################
#
# sdl_net
#
################################################################################
# The latest officially released version of SDL_image is 1.2.8, released in 2012.
# Since then, there have been several bugfixes.
#
# Version: Commits on Oct 02, 2023 (branch@SDL-1.2)
SDL_NET_VERSION = f5e3ef18937df3593c2d742ccfa89845ba13be4d
SDL_NET_SITE = $(call github,libsdl-org,SDL_net,$(SDL_NET_VERSION))
SDL_NET_SOURCE = SDL_net-$(SDL_NET_VERSION).tar.gz
SDL_NET_LICENSE = Zlib
SDL_NET_LICENSE_FILES = COPYING

SDL_NET_CONF_OPTS = \
	--with-sdl-prefix=$(STAGING_DIR)/usr \
	--with-sdl-exec-prefix=$(STAGING_DIR)/usr

SDL_NET_INSTALL_STAGING = YES

SDL_NET_DEPENDENCIES = sdl12-compat

$(eval $(autotools-package))
