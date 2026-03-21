################################################################################
#
# libfm
#
################################################################################

LIBFM_VERSION = 1.4.1
LIBFM_SITE =  $(call github,lxde,libfm,$(LIBFM_VERSION))
LIBFM_DEPENDENCIES = menu-cache libglib2 cairo libgtk3
LIBFM_LICENSE = GPL-2.0+, LGPL-2.1+
LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
LIBFM_INSTALL_STAGING = YES
LIBFM_CONF_OPTS = --with-gtk=3

ifeq ($(BR2_PACKAGE_LIBEXIF),y)
LIBFM_CONF_OPTS += --enable-exif
LIBFM_DEPENDENCIES += libexif
else
LIBFM_CONF_OPTS += --disable-exif
endif

define LIBFM_AUTOCONFIG
	cd $(@D) && PATH=/usr/bin autoreconf -f -i
endef
LIBFM_POST_PATCH_HOOKS += LIBFM_AUTOCONFIG

$(eval $(autotools-package))
