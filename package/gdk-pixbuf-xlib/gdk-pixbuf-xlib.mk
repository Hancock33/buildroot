################################################################################
#
# gdk-pixbuf-xlib
#
################################################################################

GDK_PIXBUF_XLIB_VERSION_MAJOR = 2.42
GDK_PIXBUF_XLIB_VERSION = $(GDK_PIXBUF_XLIB_VERSION_MAJOR).12
GDK_PIXBUF_XLIB_SOURCE = gdk-pixbuf-xlib-$(GDK_PIXBUF_XLIB_VERSION).tar.xz
GDK_PIXBUF_XLIB_SITE = https://download.gnome.org/sources/gdk-pixbuf-xlib/$(GDK_PIXBUF_XLIB_VERSION_MAJOR)
GDK_PIXBUF_XLIB_LICENSE = LGPL-2.1+
GDK_PIXBUF_XLIB_LICENSE_FILES = COPYING
GDK_PIXBUF_XLIB_INSTALL_STAGING = YES
GDK_PIXBUF_XLIB_DEPENDENCIES = gdk-pixbuf xlib_libX11

$(eval $(meson-package))
