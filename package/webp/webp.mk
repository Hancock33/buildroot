################################################################################
#
# webp
#
################################################################################

WEBP_VERSION = 1.3.2
WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
WEBP_SITE = http://downloads.webmproject.org/releases/webp
WEBP_LICENSE = BSD-3-Clause
WEBP_LICENSE_FILES = COPYING
WEBP_CPE_ID_VENDOR = webmproject
WEBP_CPE_ID_PRODUCT = libwebp
WEBP_INSTALL_STAGING = YES
WEBP_DEPENDENCIES = giflib jpeg libpng tiff


$(eval $(cmake-package))
$(eval $(host-cmake-package))
