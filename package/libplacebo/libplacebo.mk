################################################################################
#
# mpv
#
################################################################################

LIBPLACEBO_VERSION = v6.338.2
LIBPLACEBO_SITE = https://github.com/haasn/libplacebo
LIBPLACEBO_SITE_METHOD=git
LIBPLACEBO_GIT_SUBMODULES=YES
LIBPLACEBO_DEPENDENCIES = \
	host-pkgconf ffmpeg libass zlib \
	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
LIBPLACEBO_LICENSE = GPL-2.0+
LIBPLACEBO_LICENSE_FILES = LICENSE.GPL
LIBPLACEBO_INSTALL_STAGING = YES

# Some of these options need testing and/or tweaks
LIBPLACEBO_CONF_OPTS = \
	--prefix=/usr \
	-Dandroid=disabled \
	-Dcaca=disabled \
	-Dcocoa=disabled \
	-Dcoreaudio=disabled \
	-Dcuda-hwaccel=disabled \
	-Dopensles=disabled \
	-Drubberband=disabled \
	-Duchardet=disabled \
	-Dvapoursynth=disabled \
	-Dsdl2-gamepad=disabled \
	-Dshaderc=disabled

ifeq ($(BR2_REPRODUCIBLE),y)
LIBPLACEBO_CONF_OPTS += -Dbuild-date=disabled
endif

ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
LIBPLACEBO_CONF_OPTS += -Dalsa=enabled
LIBPLACEBO_DEPENDENCIES += alsa-lib
else
LIBPLACEBO_CONF_OPTS += -Dalsa=flase
endif

ifeq ($(BR2_PACKAGE_LIBDRM),y)
LIBPLACEBO_CONF_OPTS += -Degl-drm=enabled
else
LIBPLACEBO_CONF_OPTS += -Degl-drm=disabled
endif

# jpeg support
ifeq ($(BR2_PACKAGE_JPEG),y)
LIBPLACEBO_CONF_OPTS += -Djpeg=enabled
LIBPLACEBO_DEPENDENCIES += jpeg
else
LIBPLACEBO_CONF_OPTS += -Djpeg=disabled
endif

# lcms2 support
ifeq ($(BR2_PACKAGE_LCMS2),y)
LIBPLACEBO_CONF_OPTS += -Dlcms2=enabled
LIBPLACEBO_DEPENDENCIES += lcms2
else
LIBPLACEBO_CONF_OPTS += -Dlcms2=disabled
endif

# libarchive support
ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
LIBPLACEBO_CONF_OPTS += -Dlibarchive=enabled
LIBPLACEBO_DEPENDENCIES += libarchive
else
LIBPLACEBO_CONF_OPTS += -Dlibarchive=disabled
endif

# bluray support
ifeq ($(BR2_PACKAGE_LIBBLURAY),y)
LIBPLACEBO_CONF_OPTS += -Dlibbluray=enabled
LIBPLACEBO_DEPENDENCIES += libbluray
else
LIBPLACEBO_CONF_OPTS += -Dlibbluray=disabled
endif

# libcdio-paranoia
ifeq ($(BR2_PACKAGE_LIBCDIO_PARANOIA),y)
LIBPLACEBO_CONF_OPTS += -Dcdda=enabled
LIBPLACEBO_DEPENDENCIES += libcdio-paranoia
else
LIBPLACEBO_CONF_OPTS += -Dcdda=disabled
endif

# libdvdnav
ifeq ($(BR2_PACKAGE_LIBDVDNAV),y)
LIBPLACEBO_CONF_OPTS += -Ddvdnav=enabled
LIBPLACEBO_DEPENDENCIES += libdvdnav
else
LIBPLACEBO_CONF_OPTS += -Ddvdnav=disabled
endif

# libdrm
ifeq ($(BR2_PACKAGE_LIBDRM),y)
LIBPLACEBO_CONF_OPTS += -Ddrm=enabled
LIBPLACEBO_DEPENDENCIES += libdrm
else
LIBPLACEBO_CONF_OPTS += -Ddrm=disabled
endif

# libvdpau
ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
LIBPLACEBO_CONF_OPTS += -Dvdpau=enabled
LIBPLACEBO_DEPENDENCIES += libvdpau
else
LIBPLACEBO_CONF_OPTS += -Dvdpau=disabled
endif

# LUA support, only for lua51/lua52/luajit
# This enables the controller (OSD) together with libass
ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUAJIT),y)
LIBPLACEBO_CONF_OPTS += -Dlua=enabled
LIBPLACEBO_DEPENDENCIES += luainterpreter
else
LIBPLACEBO_CONF_OPTS += -Dlua=disabled
endif

# OpenGL support
ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
LIBPLACEBO_CONF_OPTS += -Dgl=enabled
LIBPLACEBO_DEPENDENCIES += libgl
else ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
LIBPLACEBO_CONF_OPTS += -Dgl=enabled
LIBPLACEBO_DEPENDENCIES += libgles
else ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
LIBPLACEBO_CONF_OPTS += -Dgl=enabled
LIBPLACEBO_DEPENDENCIES += libegl
else
LIBPLACEBO_CONF_OPTS += -Dgl=disabled
endif

# pulseaudio support
ifeq ($(BR2_PACKAGE_PULSEAUDIO),y)
LIBPLACEBO_CONF_OPTS += -Dpulse=enabled
LIBPLACEBO_DEPENDENCIES += pulseaudio
else
LIBPLACEBO_CONF_OPTS += -Dpulse=disabled
endif

# SDL support
# Sdl2 requires 64-bit sync intrinsics
ifeq ($(BR2_TOOLCHAIN_HAS_SYNC_8)$(BR2_PACKAGE_SDL2),yy)
LIBPLACEBO_CONF_OPTS += -Dsdl2=enabled
LIBPLACEBO_DEPENDENCIES += sdl2
else
LIBPLACEBO_CONF_OPTS += -Dsdl2=disabled
endif

# Raspberry Pi support
ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
LIBPLACEBO_CONF_OPTS += -Drpi=enabled -Dgl=enabled
LIBPLACEBO_DEPENDENCIES += rpi-userland
else
LIBPLACEBO_CONF_OPTS += -Drpi=disabled
endif

# va-api support
ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_LIBPLACEBO_SUPPORTS_VAAPI),yy)
LIBPLACEBO_CONF_OPTS += -Dvaapi=enabled
LIBPLACEBO_DEPENDENCIES += libva
ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),yy)
LIBPLACEBO_CONF_OPTS += -Dvaapi-drm=enabled
else
LIBPLACEBO_CONF_OPTS += -Dvaapi-drm=disabled
endif
else
LIBPLACEBO_CONF_OPTS += -Dvaapi=disabled -Dvaapi-drm=disabled
endif

# wayland support
ifeq ($(BR2_PACKAGE_WAYLAND),y)
LIBPLACEBO_CONF_OPTS += -Dwayland=enabled
LIBPLACEBO_DEPENDENCIES += libxkbcommon wayland wayland-protocols
else
LIBPLACEBO_CONF_OPTS += -Dwayland=disabled
endif

# Base X11 support. Config.in ensures that if BR2_PACKAGE_XORG7 is
# enabled, xlib_libX11, xlib_libXext, xlib_libXinerama,
# xlib_libXrandr, xlib_libXScrnSaver.
ifeq ($(BR2_PACKAGE_XORG7),y)
LIBPLACEBO_CONF_OPTS += -Dx11=enabled
LIBPLACEBO_DEPENDENCIES += \
	xlib_libX11 \
	xlib_libXext \
	xlib_libXinerama \
	xlib_libXpresent \
	xlib_libXrandr \
	xlib_libXScrnSaver
# XVideo
ifeq ($(BR2_PACKAGE_XLIB_LIBXV),y)
LIBPLACEBO_CONF_OPTS += -Dxv=enabled
LIBPLACEBO_DEPENDENCIES += xlib_libXv
else
LIBPLACEBO_CONF_OPTS += -Dxv=disabled
endif
else
LIBPLACEBO_CONF_OPTS += -Dx11=disabled
endif

ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
LIBPLACEBO_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -latomic"
endif

# batocera - add cuda
ifeq ($(BR2_PACKAGE_BATOCERA_NVIDIA_DRIVER_CUDA),y)
LIBPLACEBO_CONF_OPTS += -Dcuda-hwaccel=enabled
endif

$(eval $(meson-package))
