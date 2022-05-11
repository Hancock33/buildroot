################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on May 10, 2022
VULKAN_HEADERS_VERSION = 33d4dd987fc8fc6475ff9ca2b4f0c3cc6e793337
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
