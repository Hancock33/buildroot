################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Oct 27, 2022
VULKAN_HEADERS_VERSION = e12a8f8cde4047fb40c34bc1bf624e24c0d0c76e
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
