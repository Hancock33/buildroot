################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Oct 29, 2025
SPIRV_HEADERS_VERSION = f2e4bd213104fe323a01e935df56557328d37ac8
SPIRV_HEADERS_BRANCH = vulkan-tmp-1.4.333
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
