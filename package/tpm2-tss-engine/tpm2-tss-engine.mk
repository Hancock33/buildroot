################################################################################
#
# tpm2-tss-engine
#
################################################################################

TPM2_TSS_ENGINE_VERSION = 1.2.0
TPM2_TSS_ENGINE_SITE = $(call github,tpm2-software,tpm2-tss-engine,$(TPM2_TSS_ENGINE_VERSION))
TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
TPM2_TSS_ENGINE_INSTALL_STAGING = YES
TPM2_TSS_ENGINE_DEPENDENCIES = host-autoconf-archive host-pkgconf tpm2-tss
TPM2_TSS_ENGINE_AUTORECONF = YES
TPM2_TSS_ENGINE_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive

define TPM2_TSS_ENGINE_BOOTSTRAP
	echo $(TPM2_TSS_ENGINE_VERSION) > $(@D)/VERSION
endef

TPM2_TSS_ENGINE_PRE_CONFIGURE_HOOKS = TPM2_TSS_ENGINE_BOOTSTRAP

# Since the OpenSSL 3.0 Engine APIs are deprecated, suppress the warnings.
TPM2_TSS_ENGINE_CFLAGS = $(TARGET_CFLAGS) -Wno-deprecated-declarations
TPM2_TSS_ENGINE_CONF_ENV += CFLAGS="$(TPM2_TSS_ENGINE_CFLAGS)"

define TPM2_TSS_ENGINE_ENGINESDIR
	$(PKG_CONFIG_HOST_BINARY) --variable=enginesdir libcrypto \
		| xargs readlink -f \
		| sed 's%^$(STAGING_DIR)%%'
endef

TPM2_TSS_ENGINE_CONF_OPTS = \
	--disable-defaultflags \
	--with-enginesdir=`$(TPM2_TSS_ENGINE_ENGINESDIR)`

ifneq ($(BR2_PACKAGE_TPM2_TSS_ENGINE_DIGEST_SIGN),y)
TPM2_TSS_ENGINE_CONF_OPTS += --disable-digestsign
endif

$(eval $(autotools-package))
