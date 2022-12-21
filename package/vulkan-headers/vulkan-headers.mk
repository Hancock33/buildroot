################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 20, 2022
VULKAN_HEADERS_VERSION = fc90b60663965aec582d5bf7965f4e6b15173730
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
