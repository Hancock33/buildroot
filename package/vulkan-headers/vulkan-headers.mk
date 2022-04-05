################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Apr 05, 2022
VULKAN_HEADERS_VERSION = 76f00ef6cbb1886eb1162d1fa39bee8b51e22ee8
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
