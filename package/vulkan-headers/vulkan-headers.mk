################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 17, 2026
VULKAN_HEADERS_VERSION = vulkan-sdk-1.4.357.0
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))
