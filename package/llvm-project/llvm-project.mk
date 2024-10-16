################################################################################
#
# llvm-project
#
################################################################################

LLVM_PROJECT_VERSION_MAJOR = 19
LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
#LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(subst rc,-rc,$(LLVM_PROJECT_VERSION))
LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)

include $(sort $(wildcard package/llvm-project/*/*.mk))
