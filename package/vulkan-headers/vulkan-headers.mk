################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on May 24, 2022
VULKAN_HEADERS_VERSION = 245d25ce8c3337919dc7916d0e62e31a0d8748ab
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
