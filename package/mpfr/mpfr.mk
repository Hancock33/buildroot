################################################################################
#
# mpfr
#
################################################################################

MPFR_VERSION = 4.2.1
MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
MPFR_LICENSE = LGPL-3.0+
MPFR_LICENSE_FILES = COPYING.LESSER
MPFR_CPE_ID_VENDOR = mpfr
MPFR_CPE_ID_PRODUCT = gnu_mpfr
MPFR_INSTALL_STAGING = YES
MPFR_DEPENDENCIES = gmp
HOST_MPFR_DEPENDENCIES = host-gmp
MPFR_MAKE_OPTS = RANLIB=$(TARGET_RANLIB)

$(eval $(autotools-package))
$(eval $(host-autotools-package))
