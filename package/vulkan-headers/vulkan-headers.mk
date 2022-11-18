################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 17, 2022
VULKAN_HEADERS_VERSION = 974db1cedec26504fd07abd5220d846bde13ffbd
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
