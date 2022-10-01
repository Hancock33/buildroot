################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 29, 2022
VULKAN_HEADERS_VERSION = 0df9899602351e03357d3f1895cdfb73acb5d294
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
