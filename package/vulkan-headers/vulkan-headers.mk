################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 21, 2023
VULKAN_HEADERS_VERSION = 9c37439a7952c204150863fc35569dd864dbd599
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
