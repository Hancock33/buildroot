################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 26, 2024
VULKAN_HEADERS_VERSION = vulkan-sdk-1.3.296.0
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
