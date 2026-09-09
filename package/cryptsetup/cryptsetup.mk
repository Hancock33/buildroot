################################################################################
#
# cryptsetup
#
################################################################################

CRYPTSETUP_VERSION_MAJOR = 2.8
CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).8
CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
CRYPTSETUP_DEPENDENCIES = \
	lvm2 popt host-pkgconf json-c libargon2 \
	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
	$(TARGET_NLS_DEPENDENCIES)
CRYPTSETUP_LICENSE = Apache-2.0, CC-BY-SA-4.0, GPL-2.0+ (programs), LGPL-2.1+ (library)
CRYPTSETUP_LICENSE_FILES = \
	COPYING \
	docs/licenses/COPYING.Apache-2.0 \
	docs/licenses/COPYING.CC-BY-SA-4.0 \
	docs/licenses/COPYING.GPL-2.0-or-later-WITH-cryptsetup-OpenSSL-exception \
	docs/licenses/COPYING.LGPL-2.1-or-later-WITH-cryptsetup-OpenSSL-exception
CRYPTSETUP_CPE_ID_VALID = YES
CRYPTSETUP_INSTALL_STAGING = YES

CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
CRYPTSETUP_CONF_OPTS += -Dblkid=true -Dargon-implementation=internal -Dasciidoc=disabled

# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt,
# nettle, libnss or kernel crypto modules instead
ifeq ($(BR2_PACKAGE_OPENSSL),y)
CRYPTSETUP_DEPENDENCIES += openssl
CRYPTSETUP_CONF_OPTS += -Dcrypto-backend=openssl
else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
CRYPTSETUP_DEPENDENCIES += libgcrypt
CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
CRYPTSETUP_CONF_OPTS += -Dcrypto-backend=gcrypt
else ifeq ($(BR2_PACKAGE_NETTLE),y)
CRYPTSETUP_DEPENDENCIES += nettle
CRYPTSETUP_CONF_OPTS += -Dcrypto-backend=nettle
else ifeq ($(BR2_PACKAGE_LIBNSS),y)
CRYPTSETUP_DEPENDENCIES += libnss
CRYPTSETUP_CONF_OPTS += -Dcrypto-backend=nss
else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
CRYPTSETUP_DEPENDENCIES += mbedtls
CRYPTSETUP_CONF_OPTS += -Dcrypto-backend=mbedtls
else
CRYPTSETUP_CONF_OPTS += -Dcrypto-backend=kernel
endif

ifeq ($(BR2_PACKAGE_LIBSSH),y)
CRYPTSETUP_DEPENDENCIES += \
	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
	libssh
CRYPTSETUP_CONF_OPTS += -Dssh-token=true
else
CRYPTSETUP_CONF_OPTS += -Dssh-token=false
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
CRYPTSETUP_CONF_OPTS += -Dtmpfilesdir=/usr/lib/tmpfiles.d
endif

ifeq ($(BR2_STATIC_LIBS),y)
CRYPTSETUP_CONF_OPTS += -Dexternal-tokens=false
endif

HOST_CRYPTSETUP_DEPENDENCIES = \
	host-pkgconf \
	host-lvm2 \
	host-popt \
	host-util-linux \
	host-json-c \
	host-openssl

HOST_CRYPTSETUP_CONF_OPTS = -Dcrypto-backend=openssl \
	-Dkernel_crypto=false\
	-Dssh-token=false \
	-Dblkid=true \
	-Dasciidoc=disabled

$(eval $(meson-package))
$(eval $(host-meson-package))
