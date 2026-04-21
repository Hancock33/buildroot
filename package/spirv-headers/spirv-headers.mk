################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Mar 28, 2026
SPIRV_HEADERS_VERSION = 39e5d40a325973b9204d1b660eb3e026cd75fc3f
SPIRV_HEADERS_BRANCH = vulkan-tmp-1.4.349
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
