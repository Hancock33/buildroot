################################################################################
#
# vulkan-headers
#
################################################################################
# Version.: Commits on Mar 09, 2022
VULKAN_HEADERS_VERSION = 2c45218b9008dd80f6004b419777758e6459ac16
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
