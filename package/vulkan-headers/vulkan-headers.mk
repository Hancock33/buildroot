################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 07, 2022
VULKAN_HEADERS_VERSION = 9f73b931f402f23554a60015924e7e35c7047487
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
