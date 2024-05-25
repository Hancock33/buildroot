################################################################################
#
# hidapi
#
################################################################################

HIDAPI_VERSION = 0.14.0
HIDAPI_SITE = $(call github,libusb,hidapi,hidapi-$(HIDAPI_VERSION))
HIDAPI_INSTALL_STAGING = YES
HIDAPI_LICENSE = GPL-3.0 or BSD-3-Clause or HIDAPI license
HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
HIDAPI_COMPAT_INSTALL_STAGING = YES

HIDAPI_DEPENDENCIES = libusb libgudev

$(eval $(cmake-package))
