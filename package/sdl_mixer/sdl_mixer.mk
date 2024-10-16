################################################################################
#
# sdl_mixer
#
################################################################################
# Version: Commits on May 25, 2024
SDL_MIXER_VERSION = ed76d39cda0735d26c14a3e4f4da996e420f6478
SDL_MIXER_BRANCH = SDL-1.2
SDL_MIXER_SITE = $(call github,libsdl-org,SDL_mixer,$(SDL_MIXER_VERSION))
SDL_MIXER_LICENSE = Zlib
SDL_MIXER_LICENSE_FILES = COPYING

# Package does not build in parallel due to improper make rules
SDL_MIXER_MAKE = $(MAKE1)

SDL_MIXER_INSTALL_STAGING = YES
SDL_MIXER_DEPENDENCIES = sdl12-compat

# We're patching configure.in, so we need to autoreconf
SDL_MIXER_AUTORECONF = YES

SDL_MIXER_CONF_OPTS = \
	--with-sdl-prefix=$(STAGING_DIR)/usr \
	--disable-music-mod \
	--disable-music-mp3 \
	--disable-music-flac # configure script fails when cross compiling

ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
SDL_MIXER_DEPENDENCIES += fluidsynth
SDL_MIXER_CONF_OPTS += \
	--enable-music-midi \
	--enable-music-fluidsynth-midi
SDL_MIXER_HAS_MIDI = YES
endif

ifeq ($(BR2_PACKAGE_SDL_MIXER_MIDI_TIMIDITY),y)
SDL_MIXER_CONF_OPTS += \
	--enable-music-midi \
	--enable-music-timidity-midi
SDL_MIXER_HAS_MIDI = YES
endif

ifneq ($(SDL_MIXER_HAS_MIDI),YES)
SDL_MIXER_CONF_OPTS += --disable-music-midi
endif

ifeq ($(BR2_PACKAGE_LIBMAD),y)
SDL_MIXER_CONF_OPTS += --enable-music-mp3-mad-gpl
SDL_MIXER_DEPENDENCIES += libmad
else
SDL_MIXER_CONF_OPTS += --disable-music-mp3-mad-gpl
endif

ifeq ($(BR2_PACKAGE_LIBMODPLUG),y)
SDL_MIXER_CONF_OPTS += --enable-music-mod-modplug
SDL_MIXER_DEPENDENCIES += host-pkgconf libmodplug
else
SDL_MIXER_CONF_OPTS += --disable-music-mod-modplug
endif

ifeq ($(BR2_PACKAGE_TREMOR),y)
SDL_MIXER_CONF_OPTS += --enable-music-ogg-tremor
SDL_MIXER_DEPENDENCIES += tremor
else ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
SDL_MIXER_CONF_OPTS += --enable-music-ogg
SDL_MIXER_DEPENDENCIES += libvorbis
else
SDL_MIXER_CONF_OPTS += --disable-music-ogg
endif

$(eval $(autotools-package))
