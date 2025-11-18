################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 14, 2025
VULKAN_HEADERS_VERSION = 39c50d7bf094853a1f9a2e8a7e3377d425ae0c6a
VULKAN_HEADERS_BRANCH = vulkan-tmp-1.4.333
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
