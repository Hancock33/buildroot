################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 18, 2022
VULKAN_HEADERS_VERSION = b092b2fccc812453c1d0ec0a829eb8f34f174803
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
