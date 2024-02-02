################################################################################
#
# libxcrypt
#
################################################################################

LIBXCRYPT_VERSION = 4.4.36
LIBXCRYPT_SITE = $(call github,besser82,libxcrypt,v$(LIBXCRYPT_VERSION))
LIBXCRYPT_LICENSE = LGPL-2.1+
LIBXCRYPT_LICENSE_FILES = LICENSING COPYING.LIB
LIBXCRYPT_INSTALL_STAGING = YES
LIBXCRYPT_AUTORECONF = YES
LIBXCRYPT_DEPENDENCIES = glibc

# libxcrypt is part of the toolchain so disable the toolchain dependency
LIBXCRYPT_ADD_TOOLCHAIN_DEPENDENCY = NO

TARGET_CONFIGURE_OPTS += LD="$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld"
define LIBXCRYPT_CONFIGURE_CMDS
	(cd $(@D); \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="-O2 -pipe" CPPFLAGS="" \
		CXXFLAGS="-O2 -pipe" \
		$(GLIBC_CONF_ENV) \
		$(SHELL) $(@D)/configure \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--disable-werror \
		--enable-hashes=strong,glibc \
		--enable-obsolete-api=glibc  \
		--disable-failure-tokens)
endef

$(eval $(autotools-package))
