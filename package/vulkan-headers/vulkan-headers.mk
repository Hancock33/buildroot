################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Aug 18, 2022
VULKAN_HEADERS_VERSION = 715673702f5b18ffb8e5832e67cf731468d32ac6
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
