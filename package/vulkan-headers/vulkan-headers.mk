################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 17, 2023
VULKAN_HEADERS_VERSION = 6eee20744f23424ef6088167aae1b52dfbcc1385
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
