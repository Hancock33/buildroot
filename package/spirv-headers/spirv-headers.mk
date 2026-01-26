################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jan 21, 2026
SPIRV_HEADERS_VERSION = 04f10f650d514df88b76d25e83db360142c7b174
SPIRV_HEADERS_BRANCH = vulkan-sdk-1.4.341
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
