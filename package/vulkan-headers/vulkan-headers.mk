################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 31, 2023
VULKAN_HEADERS_VERSION = 63af1cf1ee906ba4dcd5a324bdd0201d4f4bfd12
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
