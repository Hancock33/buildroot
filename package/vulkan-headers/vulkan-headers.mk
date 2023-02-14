################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 30, 2023
VULKAN_HEADERS_VERSION = 93cb25c6a4cc6eeaff0da46858f45774bb51acfc
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
