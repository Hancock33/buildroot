################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Apr 10, 2026
VULKAN_HEADERS_VERSION = f6a6f7ab165cedbfa2a7d0c93fe27a2d01ce09c8
VULKAN_HEADERS_BRANCH = vulkan-tmp-1.4.349
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
