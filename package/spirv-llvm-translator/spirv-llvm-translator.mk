################################################################################
#
# spirv-llvm-translator
#
################################################################################
# Version: Commits on Sept 04, 2024
SPIRV_LLVM_TRANSLATOR_VERSION = v19.1.0
SPIRV_LLVM_TRANSLATOR_SITE = $(call github,KhronosGroup,SPIRV-LLVM-Translator,$(SPIRV_LLVM_TRANSLATOR_VERSION))
SPIRV_LLVM_TRANSLATOR_LICENSE = NCSA
SPIRV_LLVM_TRANSLATOR_LICENSE_FILES = LICENSE.TXT
SPIRV_LLVM_TRANSLATOR_INSTALL_STAGING = YES
SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = llvm spirv-headers
HOST_SPIRV_LLVM_TRANSLATOR_DEPENDENCIES = host-clang host-llvm host-spirv-headers host-spirv-tools

SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
	-DLLVM_BUILD_TOOLS=ON \
	-DLLVM_DIR=$(STAGING_DIR)/usr/lib/cmake/llvm \
	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
	-DLLVM_SPIRV_INCLUDE_TESTS=OFF \
	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(STAGING_DIR)/usr/include

HOST_SPIRV_LLVM_TRANSLATOR_CONF_OPTS = \
	-DLLVM_BUILD_TOOLS=ON \
	-DLLVM_DIR=$(HOST_DIR)/lib/cmake/llvm \
	-DLLVM_SPIRV_BUILD_EXTERNAL=YES \
	-DLLVM_SPIRV_INCLUDE_TESTS=OFF \
	-DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=$(HOST_DIR)/include

$(eval $(cmake-package))
$(eval $(host-cmake-package))
