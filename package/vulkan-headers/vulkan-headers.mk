################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 05, 2023
VULKAN_HEADERS_VERSION = 179b26a792b10d9315e44f27aff196cdc3d4018f
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
