################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 15, 2022
VULKAN_HEADERS_VERSION = 5177b119bbdf463b7b909855a83230253c2d8b68
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
