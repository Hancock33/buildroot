################################################################################
#
# rtl8822cs
#
################################################################################
# Version: Commits on Jan 13, 2025
RTL8822CS_VERSION = e2fce3c61059d1977f0ae65e648db2720dcba5f5
RTL8822CS_SITE = $(call github,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))
RTL8822CS_LICENSE = GPL-2.0

RTL8822CS_MODULE_MAKE_OPTS = \
	CONFIG_RTL8822CS=m \
	#setting KVER breaks top level parallelization
	#KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

define RTL8822CS_LINUX_CONFIG_FIXUPS
	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MAC80211)
	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
endef

$(eval $(kernel-module))
$(eval $(generic-package))
