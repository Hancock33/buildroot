################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 14, 2022
VULKAN_HEADERS_VERSION = 75a6b83f213da085ba33b82f053b956219a48730
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
