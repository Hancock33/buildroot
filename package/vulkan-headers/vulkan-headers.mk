################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 09, 2022
VULKAN_HEADERS_VERSION = 9b48e83ef8c318739f38a07e4cd15473ff09ad86
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
