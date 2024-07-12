################################################################################
#
# host-prelink-cross
#
################################################################################

PRELINK_CROSS_VERSION = 440c0059a21f06b5577499a80b55482cb99d6d1c
PRELINK_CROSS_SITE = https://git.yoctoproject.org/git/prelink-cross
PRELINK_CROSS_SITE_METHOD = git
PRELINK_CROSS_LICENSE = GPL-2.0+
PRELINK_CROSS_LICENSE_FILES = COPYING
# Sources from git, no configure script present
PRELINK_CROSS_AUTORECONF = YES
HOST_PRELINK_CROSS_DEPENDENCIES = host-elfutils host-libiberty

$(eval $(host-autotools-package))
