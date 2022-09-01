################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 01, 2022
VULKAN_HEADERS_VERSION = 9f4c61a31435a7a90a314fc68aeb386c92a09c0f
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
