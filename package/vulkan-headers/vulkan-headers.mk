################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 09, 2022
VULKAN_HEADERS_VERSION = e6cc1b3582c4b1760326790b227e04f1c504bd4b
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
