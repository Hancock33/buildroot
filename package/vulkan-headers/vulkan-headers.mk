################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 27, 2025
VULKAN_HEADERS_VERSION = 2fa203425eb4af9dfc6b03f97ef72b0b5bcb8350
VULKAN_HEADERS_BRANCH = vulkan-sdk-1.4.335
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
