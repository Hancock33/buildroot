################################################################################
#
# lilv
#
################################################################################

LILV_VERSION = 0.28.0
LILV_SITE = https://download.drobilla.net
LILV_SOURCE = lilv-$(LILV_VERSION).tar.xz
LILV_LICENSE = ISC
LILV_LICENSE_FILES = COPYING
LILV_DEPENDENCIES = host-pkgconf lv2 serd sord sratom
LILV_INSTALL_STAGING = YES

$(eval $(meson-package))
