################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on May 04, 2023
VULKAN_HEADERS_VERSION = bae9700cd9425541a0f6029957f005e5ad3ef660
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
