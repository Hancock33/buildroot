################################################################################
#
# libmspack
#
################################################################################

LIBMSPACK_VERSION = 1.11
LIBMSPACK_SITE = $(call github,kyz,libmspack,v$(LIBMSPACK_VERSION))
LIBMSPACK_LICENSE = LGPL-2.1
LIBMSPACK_LICENSE_FILES = COPYING.LIB
LIBMSPACK_SUBDIR = libmspack
LIBMSPACK_AUTORECONF = YES
LIBMSPACK_INSTALL_STAGING = YES

$(eval $(autotools-package))
