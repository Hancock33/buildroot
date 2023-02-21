################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Feb 17, 2023
VULKAN_HEADERS_VERSION = 6c683158492d6b2d35fccab6dae784fef87eaf99
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
