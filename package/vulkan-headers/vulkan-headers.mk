################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 24, 2023
VULKAN_HEADERS_VERSION = 9b9fd871b08110cd8f0b74e721b03213d9cc3081
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
