################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Apr 20, 2023
VULKAN_HEADERS_VERSION = 8a397558c4d2a4bf9e64e900c45a7e65664c32b2
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
