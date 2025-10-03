################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Sept 09, 2025
SPIRV_HEADERS_VERSION = 01e0577914a75a2569c846778c2f93aa8e6feddd
SPIRV_HEADERS_BRANCH = vulkan-sdk-1.4.328
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
