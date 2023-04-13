################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Apr 13, 2023
VULKAN_HEADERS_VERSION = 95a13d7b7118d3824f0ef236bb0438d9d51f3634
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
