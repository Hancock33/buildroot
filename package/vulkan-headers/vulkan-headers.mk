################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on May 17, 2022
VULKAN_HEADERS_VERSION = 1b4f46a3cc698eff1eb76aa2cd5a05736cd16857
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
