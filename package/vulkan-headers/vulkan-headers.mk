################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 05, 2022
VULKAN_HEADERS_VERSION = 891c40de1ae1a02b6e2475e1e9684e0fc94fff27
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
