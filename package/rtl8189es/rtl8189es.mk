################################################################################
#
# rtl8189es
#
################################################################################
# Version: Commits on May 19, 2024
RTL8189ES_VERSION = 30a52f789a0b933c4a7eb06cbf4a4d21c8e581aa
RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
RTL8189ES_LICENSE = GPL-2.0

RTL8189ES_MODULE_MAKE_OPTS = \
	CONFIG_RTL8189ES=m \
	#setting KVER breaks top level parallelization
	#KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR) \
	USER_EXTRA_CFLAGS="-Wno-error"

ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
RTL8189ES_MODULE_MAKE_OPTS += CONFIG_RTW_DEBUG=n
endif

define RTL8189ES_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
