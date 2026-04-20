################################################################################
#
# libxslt
#
################################################################################

LIBXSLT_VERSION = 1.1.45
LIBXSLT_SOURCE = libxslt-$(LIBXSLT_VERSION).tar.xz
LIBXSLT_SITE = https://download.gnome.org/sources/libxslt/1.1
LIBXSLT_INSTALL_STAGING = YES
LIBXSLT_LICENSE = MIT
LIBXSLT_LICENSE_FILES = Copyright
LIBXSLT_CPE_ID_VENDOR = xmlsoft
LIBXSLT_SUPPORTS_IN_SOURCE_BUILD = NO

LIBXSLT_CONF_OPTS = \
	-DLIBXSLT_WITH_PYTHON=OFF \
	-DLIBXSLT_WITH_TESTS=OFF
LIBXSLT_CONFIG_SCRIPTS = xslt-config
LIBXSLT_DEPENDENCIES = host-pkgconf libxml2

# If we have enabled libgcrypt then use it, else disable crypto support.
ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
LIBXSLT_DEPENDENCIES += libgcrypt
LIBXSLT_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
endif

HOST_LIBXSLT_CONF_OPTS = -DLIBXSLT_WITH_PYTHON=OFF -DLIBXSLT_WITH_TESTS=OFF

HOST_LIBXSLT_DEPENDENCIES = host-pkgconf host-libxml2

$(eval $(cmake-package))
$(eval $(host-cmake-package))
