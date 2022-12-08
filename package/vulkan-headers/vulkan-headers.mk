################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 08, 2022
VULKAN_HEADERS_VERSION = bf3b3fb14e088c189be88edfc70f514b7d679656
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
