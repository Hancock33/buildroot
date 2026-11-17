################################################################################
#
# vulkan-headers
#
################################################################################
# Version: Commits on Nov 13, 2026
VULKAN_HEADERS_VERSION = b26454f3ccd67e704117a39295fa13935fd3804c
VULKAN_HEADERS_BRANCH = vulkan-tmp-1.4.368
VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,$(VULKAN_HEADERS_VERSION))
VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
VULKAN_HEADERS_INSTALL_STAGING = YES

$(eval $(cmake-package))
$(eval $(host-cmake-package))
