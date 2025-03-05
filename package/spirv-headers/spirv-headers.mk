################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Feb 05, 2025
SPIRV_HEADERS_VERSION = 09913f088a1197aba4aefd300a876b2ebbaa3391
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
