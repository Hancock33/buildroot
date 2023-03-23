################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 23, 2023
VULKAN_HEADERS_VERSION = ee15ae402bd724cc2d1734815cb8da038f8b53fc
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
