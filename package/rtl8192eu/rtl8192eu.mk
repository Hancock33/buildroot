################################################################################
#
# rtl8192eu
#
################################################################################
# Version: Commits on Feb 11, 2023
RTL8192EU_VERSION = 4f42c0265a71137e8a633b41cad0d6e1e207ce8e
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
