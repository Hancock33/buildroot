################################################################################
#
# libmad
#
################################################################################

LIBMAD_VERSION = 0.16.5
LIBMAD_SITE = https://codeberg.org/tenacityteam/libmad/releases/download/$(LIBMAD_VERSION)
LIBMAD_INSTALL_STAGING = YES
LIBMAD_LICENSE = GPL-2.0+
LIBMAD_LICENSE_FILES = COPYING

LIBMAD_CONF_OPTS = \
	-DEXAMPLE=OFF \
	-DOPTIMIZE=$(if $(BR2_PACKAGE_LIBMAD_OPTIMIZATION_ACCURACY),ACCURACY,SPEED) \
	-DASO=$(if $(BR2_PACKAGE_LIBMAD_ASO),ON,OFF)

# The ARM fixed-point math uses inline assembly instructions that are
# not available in Thumb mode:
# Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode
# so, we deactivate Thumb mode
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
LIBMAD_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -marm"
endif

$(eval $(cmake-package))
