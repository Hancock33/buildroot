################################################################################
#
# bluez5_utils-headers
#
################################################################################

# Keep the version and patches in sync with bluez5_utils
BLUEZ5_UTILS_HEADERS_VERSION =  5.73-44-g4520eca3e5d81be77dba629cd62f8d59632240c1
BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_HEADERS_VERSION).tar.gz
BLUEZ5_UTILS_HEADERS_SITE =  $(call github,bluez,bluez,$(BLUEZ5_UTILS_HEADERS_VERSION))
BLUEZ5_UTILS_HEADERS_LICENSE = GPL-2.0+, LGPL-2.1+
BLUEZ5_UTILS_HEADERS_LICENSE_FILES = COPYING COPYING.LIB
BLUEZ5_UTILS_HEADERS_CPE_ID_VENDOR = bluez
BLUEZ5_UTILS_HEADERS_CPE_ID_PRODUCT = bluez

BLUEZ5_UTILS_HEADERS_INSTALL_STAGING = YES
BLUEZ5_UTILS_HEADERS_INSTALL_TARGET = NO

define BLUEZ5_UTILS_HEADERS_INSTALL_STAGING_CMDS
	$(INSTALL) -d $(STAGING_DIR)/usr/include/bluetooth/
	$(INSTALL) -m 644 $(@D)/lib/*.h $(STAGING_DIR)/usr/include/bluetooth/
endef

$(eval $(generic-package))
