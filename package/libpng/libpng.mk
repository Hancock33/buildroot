################################################################################
#
# libpng
#
################################################################################

LIBPNG_VERSION = 1.6.58
LIBPNG_SERIES = 16
LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
LIBPNG_LICENSE = Libpng-2.0
LIBPNG_LICENSE_FILES = LICENSE
LIBPNG_CPE_ID_VENDOR = libpng
LIBPNG_INSTALL_STAGING = YES
LIBPNG_DEPENDENCIES = host-pkgconf zlib
HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
LIBPNG_CONFIG_SCRIPTS = libpng$(LIBPNG_SERIES)-config libpng-config

LIBPNG_CONF_OPTS += -DPNG_TESTS=OFF -DPNG_TOOLS=OFF
HOST_LIBPNG_CONF_OPTS = -DPNG_TESTS=OFF -DPNG_TOOLS=OFF

ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
LIBPNG_CONF_OPTS += -DPNG_INTEL_SSE=on
else
LIBPNG_CONF_OPTS += -DPNG_INTEL_SSE=off
endif

ifeq ($(BR2_aarch64),y)
LIBPNG_CONF_OPTS += -DPNG_ARM_NEON=on
else ifeq ($(BR2_ARM_CPU_HAS_NEON):$(BR2_ARM_SOFT_FLOAT),y:)
LIBPNG_CFLAGS += -mfpu=neon
LIBPNG_CONF_OPTS += -DPNG_ARM_NEON=on
else
LIBPNG_CONF_OPTS += -DPNG_ARM_NEON=off
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
