################################################################################
#
# libzlib
#
################################################################################

LIBZLIB_VERSION = v1.3.2
LIBZLIB_SITE = $(call github,madler,zlib,$(LIBZLIB_VERSION))
LIBZLIB_LICENSE = Zlib
LIBZLIB_LICENSE_FILES = LICENSE
LIBZLIB_INSTALL_STAGING = YES
LIBZLIB_PROVIDES = zlib
LIBZLIB_CPE_ID_VENDOR = zlib
LIBZLIB_CPE_ID_PRODUCT = zlib
HOST_LIBZLIB_DEPENDENCIES = host-pkgconf
# The package is a dependency to ccache so ccache cannot be a dependency
HOST_LIBZLIB_ADD_CCACHE_DEPENDENCY = NO

# It is not possible to build only a shared version of zlib, so we build both
# shared and static, unless we only want the static libs, and we eventually
# selectively remove what we do not want
ifeq ($(BR2_STATIC_LIBS),y)
LIBZLIB_PIC =
LIBZLIB_SHARED = --static
else
LIBZLIB_PIC = -fPIC
LIBZLIB_SHARED = --shared
endif

define LIBZLIB_CONFIGURE_CMDS
	(cd $(@D); rm -rf config.cache; \
		$(TARGET_CONFIGURE_ARGS) \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS) $(LIBZLIB_PIC)" \
		./configure \
		$(LIBZLIB_SHARED) \
		--prefix=/usr \
	)
endef

define HOST_LIBZLIB_CONFIGURE_CMDS
	(cd $(@D); rm -rf config.cache; \
		$(HOST_CONFIGURE_ARGS) \
		$(HOST_CONFIGURE_OPTS) \
		CC="$(HOSTCC_NOCCACHE)" \
		CXX="$(HOSTCXX_NOCCACHE)" \
		./configure \
		--prefix="$(HOST_DIR)" \
		--sysconfdir="$(HOST_DIR)/etc" \
	)
endef

define LIBZLIB_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define HOST_LIBZLIB_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define LIBZLIB_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) LDCONFIG=true install
endef

define LIBZLIB_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR=$(TARGET_DIR) LDCONFIG=true install
endef

# We don't care removing the .a from target, since it not used at link
# time to build other packages, and it is anyway removed later before
# assembling the filesystem images anyway.
ifeq ($(BR2_SHARED_LIBS),y)
define LIBZLIB_RM_STATIC_STAGING
	rm -f $(STAGING_DIR)/usr/lib/libz.a
endef
LIBZLIB_POST_INSTALL_STAGING_HOOKS += LIBZLIB_RM_STATIC_STAGING
endif

define HOST_LIBZLIB_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) LDCONFIG=true install
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
