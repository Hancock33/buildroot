################################################################################
#
# spirv-headers
#
################################################################################

# Version: Commits on Oct 16, 2024
SPIRV_HEADERS_VERSION = 252dc2df08f58e0e50c8437edc0e77eacdfb7559
SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,$(SPIRV_HEADERS_VERSION))
SPIRV_HEADERS_LICENSE = MIT
SPIRV_HEADERS_LICENSE_FILES = LICENSE

SPIRV_HEADERS_INSTALL_STAGING = YES
SPIRV_HEADERS_INSTALL_TARGET = NO

$(eval $(cmake-package))
$(eval $(host-cmake-package))
