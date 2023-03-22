################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 18, 2023
VULKAN_HEADERS_VERSION = fa204df59c6caea6b9be3cf0754a88cd89056a87
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
