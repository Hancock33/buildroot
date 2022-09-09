################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Sept 08, 2022
VULKAN_HEADERS_VERSION = 88ebcb08cb131ca278af6e7a26887fe59b25ec1c
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
