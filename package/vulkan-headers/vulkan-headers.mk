################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Aug 28, 2023
VULKAN_HEADERS_VERSION = a0c76b4ef76e219483755ff61dce6b67ff79f24b
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
