################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jan 26, 2023
VULKAN_HEADERS_VERSION = 9f93cbe76abe9f6cb4a36df10b08fa3b78ae0027
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
