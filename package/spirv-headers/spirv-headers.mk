################################################################################
#
# spirv-headers
#
################################################################################
# Version: Commits on Dec 04, 2024
SPIRV_HEADERS_VERSION = 3f17b2af6784bfa2c5aa5dbb8e0e74a607dd8b3b
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
