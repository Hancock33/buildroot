################################################################################
#
# libglib2-bootstrap
#
################################################################################

# Since version 2.79.0 libglib2 needs gobject-introspection to build
# with introspection support. As gobject-introspection requires
# libglib2 to build this means a bootstrap process is needed, as
# described in the NEWS entry:
#
# 1. build libglib2 without introspection (this bootstrap package)
# 2. build build gobject-introspection
# 3. build libglib2 with introspection (the main libglib2 package).
#
# The bootstrap package is an implementation detail that nothing
# except gobject-introspection should depend on.

LIBGLIB2_BOOTSTRAP_VERSION_MAJOR = $(LIBGLIB2_VERSION_MAJOR)
LIBGLIB2_BOOTSTRAP_VERSION = $(LIBGLIB2_VERSION)
LIBGLIB2_BOOTSTRAP_SOURCE = $(LIBGLIB2_SOURCE)
LIBGLIB2_BOOTSTRAP_SITE = $(LIBGLIB2_SITE)
LIBGLIB2_BOOTSTRAP_LICENSE = $(LIBGLIB2_LICENSE)
LIBGLIB2_BOOTSTRAP_LICENSE_FILES = $(LIBGLIB2_LICENSE_FILES)
LIBGLIB2_BOOTSTRAP_CPE_ID_VENDOR = $(LIBGLIB2_CPE_ID_VENDOR)
LIBGLIB2_BOOTSTRAP_CPE_ID_PRODUCT = $(LIBGLIB2_CPE_ID_PRODUCT)
LIBGLIB2_BOOTSTRAP_INSTALL_STAGING = YES
LIBGLIB2_BOOTSTRAP_DL_SUBDIR = libglib2

LIBGLIB2_BOOTSTRAP_CFLAGS = $(LIBGLIB2_CFLAGS)
LIBGLIB2_BOOTSTRAP_LDFLAGS = $(LIBGLIB2_LDFLAGS)

LIBGLIB2_BOOTSTRAP_DEPENDENCIES = $(filter-out gobject-introspection,$(LIBGLIB2_DEPENDENCIES))
LIBGLIB2_BOOTSTRAP_CONF_OPTS = $(patsubst -Dintrospection=%,-Dintrospection=disabled,$(LIBGLIB2_CONF_OPTS))

HOST_LIBGLIB2_BOOTSTRAP_DEPENDENCIES = $(filter-out host-gobject-introspection,$(HOST_LIBGLIB2_DEPENDENCIES))
HOST_LIBGLIB2_BOOTSTRAP_CONF_OPTS = $(patsubst -Dintrospection=%,-Dintrospection=disabled,$(HOST_LIBGLIB2_CONF_OPTS))

LIBGLIB2_BOOTSTRAP_MESON_EXTRA_PROPERTIES = $(LIBGLIB2_MESON_EXTRA_PROPERTIES)

LIBGLIB2_BOOTSTRAP_POST_INSTALL_TARGET_HOOKS = $(LIBGLIB2_POST_INSTALL_TARGET_HOOKS)

# Finalize hooks aren't necessary for the bootstrap package, the full
# libglib2 will take care of that.

$(eval $(meson-package))
$(eval $(host-meson-package))
