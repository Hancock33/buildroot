################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Nov 12, 2025
SPIRV_HEADERS_VERSION = b824a462d4256d720bebb40e78b9eb8f78bbb305
SPIRV_HEADERS_BRANCH = vulkan-sdk-1.4.335
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
