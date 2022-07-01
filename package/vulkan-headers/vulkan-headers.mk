################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jun 30, 2022
VULKAN_HEADERS_VERSION = 2c823b7f27590ec0a489f7fbe14b154e13fa5cfb
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
