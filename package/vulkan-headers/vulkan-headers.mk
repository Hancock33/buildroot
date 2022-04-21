################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Apr 21, 2022
VULKAN_HEADERS_VERSION = 8ba8294c86d0e99fcb457bedbd573dd678ccc9b3
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
