################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Aug 25, 2023
VULKAN_HEADERS_VERSION = 9085224a1b45f78deadf94f800b0ec092d1c3568
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
