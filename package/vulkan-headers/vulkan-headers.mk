################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Oct 13, 2022
VULKAN_HEADERS_VERSION = 98f440ce6868c94f5ec6e198cc1adda4760e8849
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
