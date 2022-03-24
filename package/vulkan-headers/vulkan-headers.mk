################################################################################
#
# vulkan-headers
#
################################################################################
# Version.: Commits on Mar 23, 2022
VULKAN_HEADERS_VERSION = b6554a7ff352dcaba44c1a1a7fbfd8b54dda4136
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
