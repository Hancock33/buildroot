################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 25, 2025
VULKAN_HEADERS_VERSION = a4f8ada9f4f97c45b8c89c57997be9cebaae65d2
VULKAN_HEADERS_BRANCH = vulkan-sdk-1.4.328
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
