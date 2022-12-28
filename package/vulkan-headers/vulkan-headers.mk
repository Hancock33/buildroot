################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 27, 2022
VULKAN_HEADERS_VERSION = b232cb2bee65308b0ffbd7439635121b145502ff
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
