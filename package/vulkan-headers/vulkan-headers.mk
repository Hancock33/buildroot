################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Aug 04, 2023
VULKAN_HEADERS_VERSION = 450ead13e1064584da027d91192bd7bfb724640f
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
