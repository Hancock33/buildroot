################################################################################
#
# libxml2
#
################################################################################

LIBXML2_VERSION_MAJOR = 2.15
LIBXML2_VERSION = $(LIBXML2_VERSION_MAJOR).4
LIBXML2_SOURCE = libxml2-$(LIBXML2_VERSION).tar.xz
LIBXML2_SITE = \
	https://download.gnome.org/sources/libxml2/$(LIBXML2_VERSION_MAJOR)
LIBXML2_INSTALL_STAGING = YES
LIBXML2_LICENSE = MIT
LIBXML2_LICENSE_FILES = Copyright
LIBXML2_CPE_ID_VENDOR = xmlsoft
LIBXML2_CONFIG_SCRIPTS = xml2-config

# relocation truncated to fit: R_68K_GOT16O
ifeq ($(BR2_m68k_cf),y)
LIBXML2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mxgot"
endif

LIBXML2_CONF_OPTS = -Dhttp=enabled

HOST_LIBXML2_DEPENDENCIES = host-pkgconf
LIBXML2_DEPENDENCIES = host-pkgconf

HOST_LIBXML2_CONF_OPTS = -Dzlib=disabled

ifeq ($(BR2_PACKAGE_PYTHON3),y)
LIBXML2_DEPENDENCIES += python3
LIBXML2_CONF_OPTS += -Dpython=enabled
else
LIBXML2_CONF_OPTS += -Dpython=disabled
endif

ifeq ($(BR2_PACKAGE_HOST_PYTHON3),y)
HOST_LIBXML2_DEPENDENCIES += host-python3
HOST_LIBXML2_CONF_OPTS += -Dpython=enabled
else
HOST_LIBXML2_CONF_OPTS += -Dpython=disabled
endif

ifeq ($(BR2_PACKAGE_ICU),y)
LIBXML2_DEPENDENCIES += icu
LIBXML2_CONF_OPTS += -Dicu=enabled
else
LIBXML2_CONF_OPTS += -Dicu=disabled
endif

ifeq ($(BR2_PACKAGE_ZLIB),y)
LIBXML2_DEPENDENCIES += zlib
LIBXML2_CONF_OPTS += -Dzlib=enabled
else
LIBXML2_CONF_OPTS += -Dzlib=disabled
endif

LIBXML2_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)

ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV),y)
LIBXML2_CONF_OPTS += -Diconv=enabled
else
LIBXML2_CONF_OPTS += -Diconv=disabled
endif

define LIBXML2_CLEANUP_XML2CONF
	rm -f $(TARGET_DIR)/usr/lib/xml2Conf.sh
endef
LIBXML2_POST_INSTALL_TARGET_HOOKS += LIBXML2_CLEANUP_XML2CONF

$(eval $(meson-package))
$(eval $(host-meson-package))

# libxml2 for the host
LIBXML2_HOST_BINARY = $(HOST_DIR)/bin/xmllint
