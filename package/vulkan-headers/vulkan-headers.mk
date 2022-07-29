################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 28, 2022
VULKAN_HEADERS_VERSION = ff92049ebd7e2f7013bb9d3b0450097561cee352
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
