################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Aug 19, 2025
SPIRV_HEADERS_VERSION = a8637796c28386c3cf3b4e8107020fbb52c46f3f
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
