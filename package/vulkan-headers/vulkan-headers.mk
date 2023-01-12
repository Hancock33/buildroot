################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 12, 2023
VULKAN_HEADERS_VERSION = 460f75b518b603472a465bed7083b7864633c3a0
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
