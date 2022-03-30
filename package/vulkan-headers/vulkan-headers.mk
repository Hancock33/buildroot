################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Mar 29, 2022
VULKAN_HEADERS_VERSION = 0c5928795a66e93f65e5e68a36d8daa79a209dc2
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
