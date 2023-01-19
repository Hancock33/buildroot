################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 19, 2023
VULKAN_HEADERS_VERSION = 78448eda6ed5911c6828d5305ae750e3aab65d15
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
