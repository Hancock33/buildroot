################################################################################
#
# libfm-extra
#
################################################################################

LIBFM_EXTRA_VERSION = 1.4.0
LIBFM_EXTRA_SITE = $(call github,lxde,libfm,$(LIBFM_EXTRA_VERSION))
LIBFM_EXTRA_DEPENDENCIES = libglib2 host-intltool
LIBFM_EXTRA_LICENSE = GPL-2.0+, LGPL-2.1+
LIBFM_EXTRA_LICENSE_FILES = COPYING src/extra/fm-xml-file.c
LIBFM_EXTRA_INSTALL_STAGING = YES
LIBFM_EXTRA_CONF_OPTS = --with-extra-only --with-gtk=no
LIBFM_EXTRA_LIBTOOL_PATCH = NO

$(eval $(autotools-package))
