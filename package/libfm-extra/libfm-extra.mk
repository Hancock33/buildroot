################################################################################
#
# libfm-extra
#
################################################################################

LIBFM_EXTRA_VERSION = 1.4.0
LIBFM_EXTRA_SITE =  $(call github,lxde,libfm,$(LIBFM_EXTRA_VERSION))
LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
LIBFM_EXTRA_LICENSE = GPL-2.0+, LGPL-2.1+
LIBFM_EXTRA_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
LIBFM_EXTRA_INSTALL_STAGING = YES
LIBFM_EXTRA_AUTORECONF = YES
LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no

define LIBFM_EXTRA_RUN_AUTOGEN
	cd $(@D) && mkdir m4 && PATH=$(BR_PATH) gtkdocize --copy
endef
LIBFM_EXTRA_PRE_PATCH_HOOKS += LIBFM_EXTRA_RUN_AUTOGEN

$(eval $(autotools-package))
