################################################################################
#
# sdl_image
#
################################################################################
# The latest officially released version of SDL_image is 1.2.12, released in 2012.
# Since then, there have been many bugfixes, including security fixes.
#
# Version: Commits on Sept 26, 2023 (branch@SDL-1.2)
SDL_IMAGE_VERSION = 4a2fe2441695e3813b3f998a802f364b4cdbdd17
SDL_IMAGE_SITE = $(call github,libsdl-org,SDL_image,$(SDL_IMAGE_VERSION))
SDL_IMAGE_INSTALL_STAGING = YES
SDL_IMAGE_LICENSE = Zlib
SDL_IMAGE_LICENSE_FILES = COPYING
SDL_IMAGE_CPE_ID_VENDOR = libsdl

SDL_IMAGE_CONF_OPTS = \
	--with-sdl-prefix=$(STAGING_DIR)/usr \
	--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
	--disable-sdltest \
	--disable-static \
	--disable-jpg-shared \
	--disable-png-shared \
	--disable-tif-shared \
	--disable-webp-shared \
	--enable-bmp=$(if $(BR2_PACKAGE_SDL_IMAGE_BMP),yes,no) \
	--enable-gif=$(if $(BR2_PACKAGE_SDL_IMAGE_GIF),yes,no) \
	--enable-jpg=yes \
	--enable-lbm=$(if $(BR2_PACKAGE_SDL_IMAGE_LBM),yes,no) \
	--enable-pcx=$(if $(BR2_PACKAGE_SDL_IMAGE_PCX),yes,no) \
	--enable-png=yes \
	--enable-pnm=$(if $(BR2_PACKAGE_SDL_IMAGE_PNM),yes,no) \
	--enable-tga=$(if $(BR2_PACKAGE_SDL_IMAGE_TARGA),yes,no) \
	--enable-tif=yes \
	--enable-webp=$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),yes,no) \
	--enable-xcf=$(if $(BR2_PACKAGE_SDL_IMAGE_XCF),yes,no) \
	--enable-xpm=$(if $(BR2_PACKAGE_SDL_IMAGE_XPM),yes,no) \
	--enable-xv=$(if $(BR2_PACKAGE_SDL_IMAGE_XV),yes,no)

SDL_IMAGE_DEPENDENCIES = sdl12-compat jpeg libpng tiff \
	$(if $(BR2_PACKAGE_SDL_IMAGE_WEBP),webp)

HOST_SDL_IMAGE_CONF_OPTS = \
	--with-sdl-prefix=$(HOST_DIR) \
	--with-sdl-exec-prefix=$(HOST_DIR) \
	--disable-sdltest \
	--disable-static \
	--disable-jpg-shared \
	--disable-png-shared \
	--disable-tif-shared \
	--disable-webp-shared

HOST_SDL_IMAGE_DEPENDENCIES = host-libjpeg host-libpng host-sdl

$(eval $(autotools-package))
$(eval $(host-autotools-package))
