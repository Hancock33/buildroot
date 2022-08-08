################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Aug 05, 2022
VULKAN_HEADERS_VERSION = c896e2f920273bfee852da9cca2a356bc1c2031e
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
