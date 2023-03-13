################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 12, 2023
VULKAN_HEADERS_VERSION = d732b2de303ce505169011d438178191136bfb00
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
