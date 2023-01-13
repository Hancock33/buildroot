################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 12, 2023
VULKAN_HEADERS_VERSION = 6ea9413be28455ab172af63d14927f8453cb25f1
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
