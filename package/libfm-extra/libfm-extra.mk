################################################################################
#
# libfm-extra
#
################################################################################

LIBFM_EXTRA_VERSION = 1.4.1
LIBFM_EXTRA_SITE = $(call github,lxde,libfm,$(LIBFM_EXTRA_VERSION))
LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
LIBFM_EXTRA_LICENSE = GPL-2.0+, LGPL-2.1+
LIBFM_EXTRA_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
LIBFM_EXTRA_INSTALL_STAGING = YES
LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no

define LIBFM_EXTRA_AUTOCONFIG
	cd $(@D) && PATH=/usr/bin autoreconf -f -i
endef
LIBFM_EXTRA_POST_PATCH_HOOKS += LIBFM_EXTRA_AUTOCONFIG

$(eval $(autotools-package))
