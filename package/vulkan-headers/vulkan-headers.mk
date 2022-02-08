################################################################################
#
# vulkan-headers
#
################################################################################
# Version.: Commits on Feb 04, 2022
VULKAN_HEADERS_VERSION = b32da5329b50e3cb96229aaecba9ded032fe29cc
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
