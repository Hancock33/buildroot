################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on May 15, 2023
VULKAN_HEADERS_VERSION = 9e61870ecbd32514113b467e0a0c46f60ed222c7
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
