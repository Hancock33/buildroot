################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Jul 12, 2023
VULKAN_HEADERS_VERSION = bc14fdad60c51235e23ee569834a5baecae9231a
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
