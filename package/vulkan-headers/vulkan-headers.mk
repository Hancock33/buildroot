################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 10, 2023
VULKAN_HEADERS_VERSION = 1a8e782743e40a2949b92f4cc3905cb85fe2c181
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
