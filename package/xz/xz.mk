################################################################################
#
# xz
#
################################################################################

XZ_VERSION = 5.8.4
XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
XZ_INSTALL_STAGING = YES
XZ_LICENSE = 0BSD, GPL-2.0+, GPL-3.0+, LGPL-2.1+, FSFUL, FSFULLR, Public Domain
XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
XZ_CPE_ID_VENDOR = tukaani

# The package is a dependency to ccache so ccache cannot be a dependency
HOST_XZ_ADD_CCACHE_DEPENDENCY = NO

XZ_CONF_OPTS = \
	-DXZ_ENCODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
	-DXZ_DECODERS="lzma1;lzma2;delta;x86;powerpc;ia64;arm;armthumb;arm64;sparc;riscv" \
	-DXZ_MATCH_FINDERS="hc3;hc4;bt2;bt3;bt4" \
	-DXZ_CHECKS="crc32;crc64;sha256" \
	-DXZ_EXTERNAL_SHA256=FALSE \
	-DXZ_MICROLZMA_DECODER=TRUE \
	-DXZ_MICROLZMA_ENCODER=TRUE \
	-DXZ_LZIP_DECODER=TRUE \
	-DXZ_CLMUL_CRC=TRUE \
	-DXZ_ARM64_CRC32=TRUE \
	-DXZ_SMALL=FALSE \
	-DXZ_ASSUME_RAM=128 \
	-DXZ_TOOL_XZ=TRUE \
	-DXZ_TOOL_XZDEC=TRUE \
	-DXZ_TOOL_LZMADEC=TRUE \
	-DXZ_TOOL_LZMAINFO=TRUE \
	-DXZ_TOOL_SYMLINKS_LZMA=TRUE \
	-DXZ_TOOL_SCRIPTS=TRUE \
	-DXZ_SANDBOX=auto \
	-DXZ_SYMBOL_VERSIONING=yes \
	-DTUKLIB_FAST_UNALIGNED_ACCESS=auto \
	-DTUKLIB_USE_UNSAFE_TYPE_PUNNING=FALSE \
	-DXZ_DOC=FALSE

ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
XZ_CONF_OPTS += -DXZ_NLS=TRUE
else
XZ_CONF_OPTS += -DXZ_NLS=FALSE
endif

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
XZ_CONF_OPTS += -DXZ_THREADS=yes
else
XZ_CONF_OPTS += -DXZ_THREADS=no
endif

HOST_XZ_CONF_OPTS = \
	$(XZ_CONF_OPTS) \
	-DCMAKE_C_COMPILER_LAUNCHER=""
	-DCMAKE_CXX_COMPILER_LAUNCHER=""
	-DXZ_NLS=TRUE \
	-DXZ_THREADS=TRUE

# we are built before ccache
HOST_XZ_CONF_ENV = \
	CC="$(HOSTCC_NOCCACHE)" \
	CXX="$(HOSTCXX_NOCCACHE)"

$(eval $(cmake-package))
$(eval $(host-cmake-package))
