################################################################################
#
# llvm-openmp
#
################################################################################

LLVM_OPENMP_VERSION = $(LLVM_PROJECT_VERSION)
LLVM_OPENMP_SITE = $(LLVM_PROJECT_SITE)
LLVM_OPENMP_SOURCE = openmp-$(LLVM_OPENMP_VERSION).src.tar.xz
LLVM_OPENMP_LICENSE = Apache-2.0 with exceptions or MIT
LLVM_OPENMP_LICENSE_FILES = LICENSE.TXT

LLVM_OPENMP_DEPENDENCIES = host-clang host-llvm
LLVM_OPENMP_INSTALL_STAGING = YES

LLVM_OPENMP_CONF_OPTS = \
	-DOPENMP_STANDALONE_BUILD=ON \
	-DLLVM_CONFIG_PATH=$(HOST_DIR)/bin/llvm-config \
	-DCMAKE_MODULE_PATH=$(HOST_DIR)/lib/cmake/llvm

$(eval $(cmake-package))
