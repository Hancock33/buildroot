################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 10, 2026
VULKAN_HEADERS_VERSION = 0777a3ad88bad5f4b11cfd509458bbc0ddadc773
VULKAN_HEADERS_BRANCH = vulkan-tmp-1.4.338
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
