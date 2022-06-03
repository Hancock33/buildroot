################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jun 02, 2022
VULKAN_HEADERS_VERSION = 3ef4c97fd6ea001d75a8e9da408ee473c180e456
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
