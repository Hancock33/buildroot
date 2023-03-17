################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 15, 2023
VULKAN_HEADERS_VERSION = 65ad768d8603671fc1085fe115019e72a595ced8
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
