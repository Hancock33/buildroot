################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 22, 2023
VULKAN_HEADERS_VERSION = cb7b123f2ddc04b86fd106c3a2b2e9872e8215b5
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
