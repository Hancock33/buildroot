################################################################################
#
# rtl8189es
#
################################################################################
# Version: Commits on Aug 30, 2022
RTL8189ES_VERSION = c93cfd712a3acd2ecdeda19a66d269c20f8803f1
RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
RTL8189ES_LICENSE = GPL-2.0

RTL8189ES_MODULE_MAKE_OPTS = \
	CONFIG_RTL8189ES=m \
	KVER=$(LINUX_VERSION_PROBED) \
	KSRC=$(LINUX_DIR)

$(eval $(kernel-module))
$(eval $(generic-package))
