################################################################################
#
# vulkan-headers
#
################################################################################
# Version.: Commits on Mar 17, 2022
VULKAN_HEADERS_VERSION = 32c07c0c5334aea069e518206d75e002ccd85389
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
