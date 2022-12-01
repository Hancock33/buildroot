################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 01, 2022
VULKAN_HEADERS_VERSION = 2826791bed6a793f164bf534cd859968f13df8a9
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
