################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 10, 2023
VULKAN_HEADERS_VERSION = 2565ffa31ea67650f95f65347ed8f5917c651fac
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
