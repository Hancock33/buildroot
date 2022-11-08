################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 08, 2022
VULKAN_HEADERS_VERSION = 689821914113a7e50cc8f44913699b4127b88eb3
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
