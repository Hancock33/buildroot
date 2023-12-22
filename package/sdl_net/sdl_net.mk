################################################################################
#
# sdl_net
#
################################################################################
# The latest officially released version of SDL_image is 1.2.8, released in 2012.
# Since then, there have been several bugfixes.
#
# Version: Commits on Oct 22, 2023 (branch@SDL-1.2)
SDL_NET_VERSION = 83ba32df29225b0f29be1a6d66e678b1b1cb01ac
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
