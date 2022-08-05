################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Aug 04, 2022
VULKAN_HEADERS_VERSION = 2b55157592bf4c639b76cc16d64acaef565cc4b5
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
