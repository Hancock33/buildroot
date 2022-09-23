################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 22, 2022
VULKAN_HEADERS_VERSION = 39bcdfe388a5a88d34a941a9f75b2fd576da92cc
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
