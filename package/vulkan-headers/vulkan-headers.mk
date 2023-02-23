################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Feb 22, 2023
VULKAN_HEADERS_VERSION = 115820a6e5ff35881046a8e3920c2514c73e4a63
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
