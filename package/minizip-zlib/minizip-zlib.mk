################################################################################
#
# minizip-zlib
#
################################################################################

MINIZIP_ZLIB_VERSION = v1.3.1.2
MINIZIP_ZLIB_SITE = $(call github,madler,zlib,$(MINIZIP_ZLIB_VERSION))
MINIZIP_ZLIB_LICENSE = Zlib
MINIZIP_ZLIB_LICENSE_FILES = LICENSE
MINIZIP_ZLIB_INSTALL_STAGING = YES
MINIZIP_ZLIB_SUBDIR = contrib/minizip
# configure is not shipped in contrib/minizip
MINIZIP_ZLIB_AUTORECONF = YES
MINIZIP_ZLIB_DEPENDENCIES = zlib
# demos must be disabled to avoid a conflict with BR2_PACKAGE_MINIZIP_DEMOS
MINIZIP_ZLIB_CONF_OPTS = --disable-demos

$(eval $(autotools-package))
