################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on May 28, 2023
VULKAN_HEADERS_VERSION = 3df77fb3e4e0961f7f01de9a9ae20dfdcfc4910a
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
