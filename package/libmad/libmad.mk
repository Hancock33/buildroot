################################################################################
#
# libmad
#
################################################################################

LIBMAD_VERSION = 0.16.4
LIBMAD_SOURCE = libmad_$(LIBMAD_VERSION).orig.tar.xz
LIBMAD_SITE = \
	http://snapshot.debian.org/archive/debian/20260305T203610Z/pool/main/libm/libmad
LIBMAD_INSTALL_STAGING = YES
LIBMAD_LICENSE = GPL-2.0+
LIBMAD_LICENSE_FILES = COPYING

# libmad has some assembly function that is not present in Thumb mode:
# Error: selected processor does not support `smull r6,r7,r3,r1' in Thumb mode
# so, we deactivate Thumb mode
ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
LIBMAD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -marm"
endif

$(eval $(cmake-package))
