################################################################################
#
# libglib2
#
################################################################################

LIBGLIB2_VERSION_MAJOR = 2.76
LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
LIBGLIB2_LICENSE = LGPL-2.1+
LIBGLIB2_LICENSE_FILES = COPYING
LIBGLIB2_CPE_ID_VENDOR = gnome
LIBGLIB2_CPE_ID_PRODUCT = glib
LIBGLIB2_INSTALL_STAGING = YES

LIBGLIB2_CFLAGS = $(TARGET_CFLAGS)
LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

# glib/valgrind.h contains inline asm not compatible with thumb1
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
LIBGLIB2_CFLAGS += -marm
endif

LIBGLIB2_COMMON_CONF_OPTS = \
	-Ddtrace=false \
	-Dglib_debug=disabled \
	-Dgtk_doc=false \
	-Dlibelf=disabled \
	-Dman=false \
	-Dmultiarch=false \
	-Doss_fuzz=disabled \
	-Dsysprof=disabled \
	-Dsystemtap=false \
	-Dtests=false

HOST_LIBGLIB2_CONF_OPTS = \
	$(LIBGLIB2_COMMON_CONF_OPTS) \
	-Dnls=disabled \
	-Dselinux=disabled \
	-Dxattr=false

LIBGLIB2_DEPENDENCIES = \
	host-pkgconf \
	host-libglib2 \
	libffi \
	pcre2 \
	zlib \
	$(TARGET_NLS_DEPENDENCIES) \
	$(if $(BR2_ENABLE_LOCALE),,libiconv)

HOST_LIBGLIB2_DEPENDENCIES = \
	host-gettext \
	host-libffi \
	host-pcre2 \
	host-pkgconf \
	host-util-linux \
	host-zlib

# We explicitly specify a giomodule-dir to avoid having a value
# containing ${libdir} in gio-2.0.pc. Indeed, a value depending on
# ${libdir} would be prefixed by the sysroot by pkg-config, causing a
# bogus installation path once combined with $(DESTDIR).
LIBGLIB2_CONF_OPTS = \
	$(LIBGLIB2_COMMON_CONF_OPTS) \
	-Dgio_module_dir=/usr/lib/gio/modules \
	-Dnls=$(if $(BR2_SYSTEM_ENABLE_NLS),enabled,disabled)

LIBGLIB2_MESON_EXTRA_PROPERTIES = \
	have_c99_vsnprintf=true \
	have_c99_snprintf=true \
	have_unix98_printf=true

ifeq ($(BR2_PACKAGE_ELFUTILS),y)
LIBGLIB2_DEPENDENCIES += elfutils
endif

# Uses __atomic_compare_exchange_4
ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
LIBGLIB2_LDFLAGS += -latomic
endif

ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
LIBGLIB2_CONF_OPTS += -Dselinux=enabled -Dxattr=true
LIBGLIB2_DEPENDENCIES += libselinux
else
LIBGLIB2_CONF_OPTS += -Dselinux=disabled -Dxattr=false
endif

# Purge gdb-related files
ifneq ($(BR2_PACKAGE_GDB),y)
define LIBGLIB2_REMOVE_GDB_FILES
	rm -rf $(TARGET_DIR)/usr/share/glib-2.0/gdb
endef
endif

ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),y)
LIBGLIB2_CONF_OPTS += -Dlibmount=enabled
ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBS),y)
LIBGLIB2_DEPENDENCIES += util-linux-libs
else
LIBGLIB2_DEPENDENCIES += util-linux
endif
else
LIBGLIB2_CONF_OPTS += -Dlibmount=disabled
endif

# Purge useless binaries from target
define LIBGLIB2_REMOVE_DEV_FILES
	rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
	rm -rf $(addprefix $(TARGET_DIR)/usr/share/glib-2.0/,codegen gettext)
	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,gdbus-codegen glib-compile-schemas glib-compile-resources glib-genmarshal glib-gettextize glib-mkenums gobject-query gtester gtester-report)
	$(LIBGLIB2_REMOVE_GDB_FILES)
endef

LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_DEV_FILES

# Newer versions of libglib2 prefix glib-genmarshal, gobject-query,
# glib-mkenums, glib_compile_schemas, glib_compile_resources and gdbus-codegen
# with ${bindir}. Unfortunately, this will resolve to the host systems /bin/
# directory, which will cause compilation issues if the host does not have these
# programs. By removing the ${bindir}/ prefix, these programs are resolved in
# PATH instead.
define LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE
	$(SED) 's%$${bindir}/%%g' $(addprefix $(STAGING_DIR)/usr/lib/pkgconfig/, glib-2.0.pc gio-2.0.pc)
endef
LIBGLIB2_POST_INSTALL_TARGET_HOOKS += LIBGLIB2_REMOVE_BINDIR_PREFIX_FROM_PC_FILE

# Remove schema sources/DTDs, we use staging ones to compile them.
# Do so at target finalization since other packages install additional
# ones and we want to deal with it in a single place.
define LIBGLIB2_REMOVE_TARGET_SCHEMAS
	rm -f $(TARGET_DIR)/usr/share/glib-2.0/schemas/*.xml \
		$(TARGET_DIR)/usr/share/glib-2.0/schemas/*.dtd
endef

# Compile schemas at target finalization since other packages install
# them as well, and better do it in a central place.
# It's used at run time so it doesn't matter defering it.
define LIBGLIB2_COMPILE_SCHEMAS
	$(HOST_DIR)/bin/glib-compile-schemas \
		$(STAGING_DIR)/usr/share/glib-2.0/schemas \
		--targetdir=$(TARGET_DIR)/usr/share/glib-2.0/schemas
endef

LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_REMOVE_TARGET_SCHEMAS
LIBGLIB2_TARGET_FINALIZE_HOOKS += LIBGLIB2_COMPILE_SCHEMAS

$(eval $(meson-package))
$(eval $(host-meson-package))

LIBGLIB2_HOST_BINARY = $(HOST_DIR)/bin/glib-genmarshal
