################################################################################
#
# libfm
#
################################################################################

LIBFM_VERSION = 1.4.0
LIBFM_SITE =  $(call github,lxde,libfm,$(LIBFM_VERSION))
LIBFM_DEPENDENCIES = menu-cache libglib2 cairo
LIBFM_LICENSE = GPL-2.0+, LGPL-2.1+
LIBFM_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
LIBFM_INSTALL_STAGING = YES
LIBFM_AUTORECONF = YES

ifeq ($(BR2_PACKAGE_LIBEXIF),y)
LIBFM_CONF_OPTS += --enable-exif
LIBFM_DEPENDENCIES += libexif
else
LIBFM_CONF_OPTS += --disable-exif
endif

ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
LIBFM_CONF_OPTS += --with-gtk=3
LIBFM_DEPENDENCIES += libgtk3
else
LIBFM_CONF_OPTS += --with-gtk=2
LIBFM_DEPENDENCIES += libgtk2
endif

define LIBFM_RUN_AUTOGEN
	cd $(@D) && mkdir m4 && PATH=$(BR_PATH) gtkdocize --copy
endef
LIBFM_PRE_PATCH_HOOKS += LIBFM_EXTRA_RUN_AUTOGEN

$(eval $(autotools-package))
