################################################################################
#
# vulkan-headers
#
################################################################################
# Version.: Commits on Mar 15, 2022
VULKAN_HEADERS_VERSION = 384881cc90fe243b4d29bfbc359f59752c2be995
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
