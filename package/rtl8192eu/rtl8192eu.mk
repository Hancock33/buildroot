################################################################################
#
# rtl8192eu
#
################################################################################
# Version: Commits on Oct 26, 2022
RTL8192EU_VERSION = 2181717490b6399b84f02066a2bd14e49c8a6fc4
RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
RTL8192EU_LICENSE = GPL-2.0
RTL8192EU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8192EU=m \
	USER_EXTRA_CFLAGS="-Wno-error"

define RTL8192EU_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
