################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 21, 2022
VULKAN_HEADERS_VERSION = 87d2aa9d77bc979559c2d4adabe5b12bb1d49d51
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
