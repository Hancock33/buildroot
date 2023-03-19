################################################################################
#
# rtl8192eu
#
################################################################################
# Version: Commits on Mar 11, 2023
RTL8192EU_VERSION = ceedf761d6a02f3da4ac235d199b9dc1e7e840a1
RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
RTL8192EU_LICENSE = GPL-2.0

RTL8192EU_USER_EXTRA_CFLAGS = -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
			      -DCONFIG_IOCTL_CFG80211 \
			      -DRTW_USE_CFG80211_STA_EVENT \
			      -Wno-error

RTL8192EU_MODULE_MAKE_OPTS = \
	CONFIG_PLATFORM_I386_PC=n \
	CONFIG_RTL8192EU=m \
	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CFLAGS)"

define RTL8192EU_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
