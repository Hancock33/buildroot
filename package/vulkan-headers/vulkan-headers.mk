################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Aug 14, 2023
VULKAN_HEADERS_VERSION = 85c2334e92e215cce34e8e0ed8b2dce4700f4a50
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
