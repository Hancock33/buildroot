################################################################################
#
# spirv-headers
#
################################################################################

# Keep in sync with spirv-tools version
SPIRV_HEADERS_VERSION = 8b246ff75c6615ba4532fe4fde20f1be090c3764
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
