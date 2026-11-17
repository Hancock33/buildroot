################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Nov 04, 2026
SPIRV_HEADERS_VERSION = 6efe5ae6b7c6ad29da3f2cc3f164b9c3d72b78b1
SPIRV_HEADERS_HEADERS_BRANCH = vulkan-tmp-1.4.368
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
