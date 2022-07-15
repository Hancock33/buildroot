################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 14, 2022
VULKAN_HEADERS_VERSION = 16847a61009f23b73b6de658a64e42926efc1ea9
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
