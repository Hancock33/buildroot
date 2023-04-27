################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Apr 27, 2023
VULKAN_HEADERS_VERSION = 870a531486f77dfaf124395de80ed38867400d31
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
