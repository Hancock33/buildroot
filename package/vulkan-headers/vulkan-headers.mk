################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jun 02, 2023
VULKAN_HEADERS_VERSION = 605dc6d3e789630d24310435121cd0c7d51b6483
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
