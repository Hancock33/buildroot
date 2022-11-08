################################################################################
#
# rtl8821au
#
################################################################################

# Version: Commits on Oct 30, 2022
RTL8821AU_VERSION = 455e6e4c8a288767b399296da1eeb13eafa70f2b
RTL8821AU_SITE = $(call github,lwfinger,rtl8812au,$(RTL8821AU_VERSION))
RTL8821AU_LICENSE = GPL-2.0
RTL8821AU_LICENSE_FILES = LICENSE

RTL8821AU_MODULE_MAKE_OPTS = \
	CONFIG_RTL8812AU_8821AU=m \
# batocera: setting KVER breaks top level parallelization
	# KVER=$(LINUX_VERSION_PROBED)
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

$(eval $(kernel-module))
$(eval $(generic-package))
