################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Oct 08, 2025
VULKAN_HEADERS_VERSION = 19725e4d48082fe78e26622b15d3080ccd54112b
VULKAN_HEADERS_BRANCH = vulkan-sdk-1.4.328
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
