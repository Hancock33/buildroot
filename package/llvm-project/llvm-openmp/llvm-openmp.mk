################################################################################
#
# llvm-openmp
#
################################################################################

LLVM_OPENMP_VERSION = $(LLVM_PROJECT_VERSION)
LLVM_OPENMP_SITE = $(LLVM_PROJECT_SITE)
LLVM_OPENMP_SOURCE = $(LLVM_PROJECT_SOURCE)
LLVM_OPENMP_DL_SUBDIR = llvm-project
LLVM_OPENMP_LICENSE = Apache-2.0 with exceptions
LLVM_OPENMP_LICENSE_FILES = LICENSE.TXT
LLVM_OPENMP_SUBDIR = openmp
LLVM_OPENMP_SUPPORTS_IN_SOURCE_BUILD = NO

LLVM_OPENMP_DEPENDENCIES = host-clang host-llvm
LLVM_OPENMP_INSTALL_STAGING = YES

LLVM_OPENMP_CONF_OPTS = \
	-DOPENMP_STANDALONE_BUILD=ON \
	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm

$(eval $(cmake-package))
