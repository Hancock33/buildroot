################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 11, 2023
VULKAN_HEADERS_VERSION = ab48b9b20da5296c9d77756a3d8de4677d4c1fe2
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
