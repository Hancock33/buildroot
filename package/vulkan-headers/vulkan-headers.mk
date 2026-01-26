################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 23, 2026
VULKAN_HEADERS_VERSION = b5c8f996196ba4aa6d8f97e52b5d3b6e70f7e4e2
VULKAN_HEADERS_BRANCH = vulkan-sdk-1.4.341
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
