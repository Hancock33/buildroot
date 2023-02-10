################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Feb 08, 2023
VULKAN_HEADERS_VERSION = e8b8e06d092ab406b097907ecaae1a8aae9c7d53
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
