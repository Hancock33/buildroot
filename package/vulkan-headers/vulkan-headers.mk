################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 30, 2023
VULKAN_HEADERS_VERSION = 0c34d02861745528b85c082e4f84f2c82bde8772
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
