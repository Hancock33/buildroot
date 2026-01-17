################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Jan 07, 2026
SPIRV_HEADERS_VERSION = babee77020ff82b571d723ce2c0262e2ec0ee3f1
SPIRV_HEADERS_BRANCH = vulkan-tmp-1.4.338
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
