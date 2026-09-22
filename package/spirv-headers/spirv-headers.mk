################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 26, 2026
SPIRV_HEADERS_VERSION = 496543121ce6419f23d6fa5d7194ba66c36212d2
SPIRV_HEADERS_HEADERS_BRANCH = vulkan-sdk-1.4.363
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
