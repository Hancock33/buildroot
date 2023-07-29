################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 28, 2023
VULKAN_HEADERS_VERSION = 94bb3c998b9156b9101421f7614617dfcf7f4256
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
