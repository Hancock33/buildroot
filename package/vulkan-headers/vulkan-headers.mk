################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 03, 2022
VULKAN_HEADERS_VERSION = d4c221772cb222117446521517254c91f9211801
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
