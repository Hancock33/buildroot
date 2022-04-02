################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 29, 2022
VULKAN_HEADERS_VERSION = 628eaec640e117b859cfd80e4b1abb2570e08ccd
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
