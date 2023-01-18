################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 16, 2023
VULKAN_HEADERS_VERSION = 08bfe2e226bf0c739c1aa3a98903e3913d458f13
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
