################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jun 23, 2023
VULKAN_HEADERS_VERSION = b6a29e5ca865f48368f6b2f170adb89975bb0be1
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
