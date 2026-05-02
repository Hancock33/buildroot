################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on May 01, 2026
SPIRV_HEADERS_VERSION = 126038020c2bd47efaa942ccc364ca5353ffccde
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
