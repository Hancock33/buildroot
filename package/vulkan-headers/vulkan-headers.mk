################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 23, 2023
VULKAN_HEADERS_VERSION = a49166a89a1abc6df2d5147bd06bd4c5b7c4d010
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
