################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 08, 2022
VULKAN_HEADERS_VERSION = 29c0457cc167bfc9e9361a3818440e388986f5b5
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
