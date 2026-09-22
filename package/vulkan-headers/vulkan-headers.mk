################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 18, 2026
VULKAN_HEADERS_VERSION = 6802bb4733b63ed5efd3adb308a6c885ef180ea1
VULKAN_HEADERS_BRANCH = vulkan-sdk-1.4.363
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))
