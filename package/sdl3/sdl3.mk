################################################################################
#
# sdl3
#
################################################################################

SDL3_VERSION = 3.4.14
SDL3_SOURCE = SDL3-$(SDL3_VERSION).tar.gz
SDL3_SITE = http://www.libsdl.org/release
SDL3_LICENSE = Zlib
SDL3_LICENSE_FILES = LICENSE.txt
SDL3_CPE_ID_VENDOR = libsdl
SDL3_CPE_ID_PRODUCT = simple_directmedia_layer
SDL3_INSTALL_STAGING = YES

SDL3_CONF_OPTS = \
	-DSDL_DUMMYVIDEO=OFF \
	-DSDL_HIDAPI=OFF \
	-DSDL_IBUS=OFF \
	-DSDL_INSTALL_DOCS=OFF \
	-DSDL_JOYSTICK_MFI=OFF \
	-DSDL_JOYSTICK_VIRTUAL=OFF \
	-DSDL_OFFSCREEN=OFF \
	-DSDL_RENDER_D3D=OFF \
	-DSDL_RPATH=OFF \
	-DSDL_STATIC=ON \
	-DSDL_VIVANTE=OFF

# SDL3 fails to build in Thumb mode on some ARM architectures
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
SDL3_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
endif

# SDL3 needs <fenv.h> when Arm Neon is enabled.
# https://github.com/libsdl-org/SDL/blob/release-3.4.12/src/audio/SDL_audiotypecvt.c#L26
# The <fenv.h> header is not available by default in uClibc, so we
# disable Neon in that specific case.
ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_ARM_CPU_HAS_NEON),yy)
SDL3_CONF_OPTS += -DSDL_ARMNEON=OFF
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
SDL3_DEPENDENCIES += udev
SDL3_CONF_OPTS += -DSDL_LIBUDEV=ON
else
SDL3_CONF_OPTS += -DSDL_LIBUDEV=OFF
endif

ifeq ($(BR2_X86_CPU_HAS_SSE),y)
SDL3_CONF_OPTS += -DSDL_SSE=ON
else
SDL3_CONF_OPTS += -DSDL_SSE=OFF
endif

ifeq ($(BR2_PACKAGE_SDL3_X11),y)
SDL3_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXi xlib_libXtst
SDL3_CONF_OPTS += -DSDL_X11=ON
SDL3_CONF_OPTS += -DSDL_X11_SHARED=ON
    ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
        SDL3_DEPENDENCIES += xlib_libXcursor
        SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=ON
    else
        SDL3_CONF_OPTS += -DSDL_X11_XCURSOR=OFF
    endif
    ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
        SDL3_DEPENDENCIES += xlib_libXfixes
        SDL3_CONF_OPTS += -DSDL_X11_XFIXES=ON
    else
        SDL3_CONF_OPTS += -DSDL_X11_XFIXES=OFF
    endif
    ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
        SDL3_DEPENDENCIES += xlib_libXrandr
        SDL3_CONF_OPTS += -DSDL_X11_XRANDR=ON
    else
        SDL3_CONF_OPTS += -DSDL_X11_XRANDR=OFF
        endif
    ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
        SDL3_DEPENDENCIES += xlib_libXScrnSaver
        SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=ON
    else
        SDL3_CONF_OPTS += -DSDL_X11_XSCRNSAVER=OFF
    endif
    ifeq ($(BR2_PACKAGE_XAPP_XINPUT),y)
        SDL3_DEPENDENCIES += xapp_xinput
        SDL3_CONF_OPTS += -DSDL_X11_XINPUT=ON
    else
        SDL3_CONF_OPTS += -DSDL_X11_XINPUT=OFF
    endif
else
SDL3_CONF_OPTS += -DSDL_X11=OFF
SDL3_CONF_OPTS += -DSDL_X11_SHARED=OFF
endif

ifeq ($(BR2_PACKAGE_SDL3_WAYLAND),y)
SDL3_DEPENDENCIES += libegl libxkbcommon wayland wayland-protocols
SDL3_CONF_OPTS += -DSDL_WAYLAND=ON
else
SDL3_CONF_OPTS += -DSDL_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_SDL3_OPENGL),y)
SDL3_DEPENDENCIES += libgl
SDL3_CONF_OPTS += -DSDL_OPENGL=ON
else
SDL3_CONF_OPTS += -DSDL_OPENGL=OFF
endif

ifeq ($(BR2_PACKAGE_SDL3_OPENGLES),y)
SDL3_DEPENDENCIES += libgles libegl
SDL3_CONF_OPTS += -DSDL_OPENGLES=ON
else
SDL3_CONF_OPTS += -DSDL_OPENGLES=OFF
endif

# The explicit dependencies make sure libdrm/gbm/egl are built before
# sdl3, otherwise the kmsdrm video driver is silently disabled at
# configure time.
ifeq ($(BR2_PACKAGE_SDL3_KMSDRM),y)
SDL3_DEPENDENCIES += libdrm libgbm libegl
SDL3_CONF_OPTS += -DSDL_KMSDRM=ON
else
SDL3_CONF_OPTS += -DSDL_KMSDRM=OFF
endif

#Batocera updates
ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
SDL3_DEPENDENCIES += alsa-lib
SDL3_CONF_OPTS += -DSDL_ALSA=ON
SDL3_CONF_OPTS += -DSDL_ALSA_SHARED=ON
else
SDL3_CONF_OPTS += -DSDL_ALSA=OFF
SDL3_CONF_OPTS += -DSDL_ALSA_SHARED=OFF
endif

ifeq ($(BR2_PACKAGE_DBUS),y)
SDL3_DEPENDENCIES += dbus
SDL3_CONF_OPTS += -DSDL_DBUS=ON
else
SDL3_CONF_OPTS += -DSDL_DBUS=OFF
endif

ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
SDL3_DEPENDENCIES += pulseaudio
SDL3_CONF_OPTS += -DSDL_PULSEAUDIO=ON
SDL3_CONF_OPTS += -DSDL_PULSEAUDIO_SHARED=ON
else
SDL3_CONF_OPTS += -DSDL_PULSEAUDIO=OFF
SDL3_CONF_OPTS += -DSDL_PULSEAUDIO_SHARED=OFF
endif

ifeq ($(BR2_PACKAGE_MESA3D),y)
SDL3_DEPENDENCIES += mesa3d
SDL3_CONF_OPTS += -DSDL_RENDER_GPU=ON
else
SDL3_CONF_OPTS += -DSDL_RENDER_GPU=OFF
endif

ifeq ($(BR2_PACKAGE_PIPEWIRE),y)
SDL3_DEPENDENCIES += pipewire
SDL3_CONF_OPTS += -DSDL_PIPEWIRE=ON
else
SDL3_CONF_OPTS += -DSDL_PIPEWIRE=OFF
endif

ifeq ($(BR2_PACKAGE_BATOCERA_VULKAN),y)
SDL3_DEPENDENCIES += mesa3d vulkan-loader
SDL3_CONF_OPTS += -DSDL_VULKAN=ON
SDL3_CONF_OPTS += -DSDL_RENDER_VULKAN=ON
else
SDL3_CONF_OPTS += -DSDL_VULKAN=OFF
SDL3_CONF_OPTS += -DSDL_RENDER_VULKAN=OFF
endif

# Add option for a system without a standard desktop windowing environment.
ifeq ($(BR2_PACKAGE_SDL3_WAYLAND)$(BR2_PACKAGE_SDL3_X11),)
SDL3_CONF_OPTS += -DSDL_UNIX_CONSOLE_BUILD=ON
endif

# SDL3 installs a copy of its license on the target, drop it
define SDL3_REMOVE_LICENSES
	rm -rf $(TARGET_DIR)/usr/share/licenses/SDL3
endef
SDL3_POST_INSTALL_TARGET_HOOKS += SDL3_REMOVE_LICENSES

$(eval $(cmake-package))
