################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 19, 2022
VULKAN_HEADERS_VERSION = 00671c64ba5c488ade22ad572a0ef81d5e64c803
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
