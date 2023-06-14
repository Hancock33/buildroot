################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jun 10, 2023
VULKAN_HEADERS_VERSION = cb71b646f1389822409a281252689492a18905b9
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
