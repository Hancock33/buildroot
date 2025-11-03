################################################################################
#
# librsvg
#
################################################################################

LIBRSVG_VERSION = 2.61.2
LIBRSVG_SITE = https://gitlab.gnome.org/GNOME/librsvg/-/archive/$(LIBRSVG_VERSION)
LIBRSVG_INSTALL_STAGING = YES
LIBRSVG_LICENSE = LGPL-2.1+
LIBRSVG_LICENSE_FILES = COPYING.LIB
LIBRSVG_CPE_ID_VENDOR = gnome

LIBRSVG_DOWNLOAD_POST_PROCESS = cargo
LIBRSVG_DL_ENV = $(PKG_CARGO_ENV)

LIBRSVG_CONF_ENV = $(PKG_CARGO_ENV)
LIBRSVG_NINJA_ENV = $(PKG_CARGO_ENV)
LIBRSVG_CONF_OPTS = \
	-Dtriplet=$(RUSTC_TARGET_NAME) \
	-Drsvg-convert=disabled \
	-Dpixbuf-loader=disabled \
	-Ddocs=disabled \
	-Dtests=false
LIBRSVG_DEPENDENCIES = \
	host-cairo \
	host-cargo-c \
	host-libxml2 \
	host-pango \
	host-rustc \
	cairo \
	gdk-pixbuf \
	libglib2 \
	libxml2 \
	pango \
	$(TARGET_NLS_DEPENDENCIES)

HOST_LIBRSVG_CONF_ENV = $(HOST_PKG_CARGO_ENV)
HOST_LIBRSVG_NINJA_ENV = $(HOST_PKG_CARGO_ENV)
HOST_LIBRSVG_CONF_OPTS = \
	-Dintrospection=disabled
HOST_LIBRSVG_DEPENDENCIES = \
	host-cairo \
	host-cargo-c \
	host-gdk-pixbuf \
	host-libglib2 \
	host-libxml2 \
	host-pango \
	host-rustc

ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
LIBRSVG_CONF_OPTS += -Dintrospection=disabled
LIBRSVG_DEPENDENCIES += gobject-introspection
else
LIBRSVG_CONF_OPTS += -Dintrospection=disabled
endif

ifeq ($(BR2_PACKAGE_DAV1D),y)
LIBRSVG_CONF_OPTS += -Davif=enabled
LIBRSVG_DEPENDENCIES += host-dav1d dav1d
else
LIBRSVG_CONF_OPTS += -Davif=disabled
endif

$(eval $(meson-package))
$(eval $(host-meson-package))
