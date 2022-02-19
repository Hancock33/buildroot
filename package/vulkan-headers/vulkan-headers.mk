################################################################################
#
# vulkan-headers
#
################################################################################
# Version.: Commits on Feb 18, 2022
VULKAN_HEADERS_VERSION = aa18f182ebba65438b1cfdbd571f020bb2e34d04
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
