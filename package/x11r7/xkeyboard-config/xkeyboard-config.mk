################################################################################
#
# xkeyboard-config
#
################################################################################

XKEYBOARD_CONFIG_VERSION = 2.49
XKEYBOARD_CONFIG_SITE = https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/archive/xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION)/xkeyboard-config-xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.gz?ref_type=tags
#XKEYBOARD_CONFIG_SOURCE = xkeyboard-config-$(XKEYBOARD_CONFIG_VERSION).tar.xz
XKEYBOARD_CONFIG_LICENSE = MIT
XKEYBOARD_CONFIG_LICENSE_FILES = COPYING

XKEYBOARD_CONFIG_CPE_ID_VENDOR = xkeyboard_config_project

XKEYBOARD_CONFIG_DEPENDENCIES = \
	$(BR2_PYTHON3_HOST_DEPENDENCY) \
	host-gettext \
	host-xapp_xkbcomp

# xkeyboard-config.pc
XKEYBOARD_CONFIG_INSTALL_STAGING = YES

$(eval $(meson-package))
