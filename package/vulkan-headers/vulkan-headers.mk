################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Dec 16, 2022
VULKAN_HEADERS_VERSION = 63637cb1c6ad62522b98a241e8ae49c09ef23e61
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0
VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
