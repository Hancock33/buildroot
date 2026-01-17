################################################################################
#
# spirv-tools
#
################################################################################
# Version: Commits on Jan 08, 2026
SPIRV_TOOLS_VERSION = 31a9403f7a96336545467fc7949fe4a67678179f
SPIRV_TOOLS_BRANCH = vulkan-tmp-1.4.338
SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,$(SPIRV_TOOLS_VERSION))
SPIRV_TOOLS_LICENSE = Apache-2.0
SPIRV_TOOLS_LICENSE_FILES = LICENSE
SPIRV_TOOLS_DEPENDENCIES = spirv-headers
HOST_SPIRV_TOOLS_DEPENDENCIES = host-spirv-headers
SPIRV_TOOLS_INSTALL_STAGING = YES

SPIRV_TOOLS_CONF_OPTS = \
	-DSPIRV-Headers_SOURCE_DIR=$(STAGING_DIR)/usr \
	-DSPIRV_TOOLS_BUILD_STATIC=OFF \
	-DSPIRV_SKIP_TESTS=ON \
	-DSPIRV_WERROR=OFF

HOST_SPIRV_TOOLS_CONF_OPTS = \
	-DSPIRV-Headers_SOURCE_DIR=$(HOST_DIR) \
	-DSPIRV_TOOLS_BUILD_STATIC=OFF \
	-DSPIRV_SKIP_TESTS=ON \
	-DSPIRV_WERROR=OFF

$(eval $(cmake-package))
$(eval $(host-cmake-package))
