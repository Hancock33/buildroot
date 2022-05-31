################################################################################
#
# mesa3d-demos
#
################################################################################

MESA3D_DEMOS_VERSION = 8.5.0
MESA3D_DEMOS_SOURCE = mesa-demos-$(MESA3D_DEMOS_VERSION).tar.bz2
MESA3D_DEMOS_SITE = https://archive.mesa3d.org/demos/$(MESA3D_DEMOS_VERSION)
# 0001-demos-makes-opengl-an-optional-component.patch
MESA3D_DEMOS_AUTORECONF = YES
MESA3D_DEMOS_DEPENDENCIES = host-pkgconf
MESA3D_DEMOS_LICENSE = MIT

MESA3D_DEMOS_CONF_OPTS += \
	--disable-gles1 --enable-autotools

ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_HAS_LIBGL),yy)
MESA3D_DEMOS_DEPENDENCIES += libgl libglew libglu xlib_libX11 xlib_libXext
MESA3D_DEMOS_CONF_OPTS += --enable-gl --enable-x11
else
MESA3D_DEMOS_CONF_OPTS += --disable-gl --disable-x11
endif

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
MESA3D_DEMOS_DEPENDENCIES += libegl
MESA3D_DEMOS_CONF_OPTS += --enable-egl
else
MESA3D_DEMOS_CONF_OPTS += --disable-egl
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
MESA3D_DEMOS_DEPENDENCIES += libgles
MESA3D_DEMOS_CONF_OPTS += --enable-gles2
else
MESA3D_DEMOS_CONF_OPTS += --disable-gles2
endif

ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
MESA3D_DEMOS_DEPENDENCIES += mesa3d
MESA3D_DEMOS_CONF_OPTS += --enable-gbm
else
MESA3D_DEMOS_CONF_OPTS += --disable-gbm
endif

ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
MESA3D_DEMOS_DEPENDENCIES += libfreeglut
MESA3D_DEMOS_CONF_OPTS += --with-glut=$(STAGING_DIR)/usr
# osmesa support depends on glut
ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
MESA3D_DEMOS_CONF_OPTS += --enable-osmesa
else
MESA3D_DEMOS_CONF_OPTS += --disable-osmesa
endif
else
MESA3D_DEMOS_CONF_OPTS += --without-glut --disable-osmesa
endif

ifeq ($(BR2_PACKAGE_WAYLAND),y)
MESA3D_DEMOS_DEPENDENCIES += wayland
MESA3D_DEMOS_CONF_OPTS += --enable-wayland
else
MESA3D_DEMOS_CONF_OPTS += --disable-wayland
endif

$(eval $(autotools-package))
