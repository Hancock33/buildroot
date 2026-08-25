################################################################################
#
# opus
#
################################################################################

OPUS_VERSION = 1.6.1
OPUS_SITE = https://downloads.xiph.org/releases/opus
OPUS_LICENSE = BSD-3-Clause
OPUS_LICENSE_FILES = COPYING
OPUS_CPE_ID_VENDOR = opus-codec
OPUS_INSTALL_STAGING = YES

OPUS_CONF_ENV = CFLAGS="$(OPUS_CFLAGS)"
OPUS_CONF_OPTS = -DOPUS_CUSTOM_MODES=ON

ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
OPUS_CONF_OPTS += -DOPUS_FLOAT_APPROX=ON
endif

ifeq ($(BR2_OPTIMIZE_FAST),y)
OPUS_CONF_OPTS += --enable-float-approx
endif


ifeq ($(BR2_X86_CPU_HAS_MMX),y)
OPUS_CONF_OPTS += -DOPUS_CHECK_ASM=ON
endif

# We also disable assembly in case we have a soft-float ABI (opus has
# NEON instructions which are not available in that case).
ifeq ($(BR2_arm),y)
OPUS_CONF_OPTS += -DOPUS_DISABLE_INTRINSICS=ON
endif

# batocera workaround rk3288 test programs build failure
ifeq ($(BR2_cortex_a17),y)
OPUS_CONF_OPTS += -DOPUS_BUILD_PROGRAMS=OFF
endif

$(eval $(cmake-package))
