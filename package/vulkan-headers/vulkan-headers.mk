################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jun 29, 2023
VULKAN_HEADERS_VERSION = ad5f8ee9750e99c5397d44c075ae5d8a38271de4
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
