################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 29, 2023
VULKAN_HEADERS_VERSION = a3b683653e6a498514ef8a1865594810e91c594c
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
