################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jun 16, 2022
VULKAN_HEADERS_VERSION = 3be1df310be8963c29125c35fce25ee0af12ff70
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
