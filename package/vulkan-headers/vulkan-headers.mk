################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Feb 26, 2023
VULKAN_HEADERS_VERSION = a3dd2655a3a68c2a67c55a0f8b77dcb8b166ada2
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
