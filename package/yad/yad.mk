################################################################################
#
# yad
#
################################################################################

YAD_VERSION = 14.1
YAD_SITE = $(call github,v1cont,yad,v$(YAD_VERSION))
YAD_LICENSE = GPL-3.0
YAD_LICENSE_FILES = COPYING
YAD_DEPENDENCIES = host-intltool host-pkgconf $(TARGET_NLS_DEPENDENCIES)
YAD_AUTORECONF = YES
YAD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)

YAD_CONF_OPTS = --enable-html=no

$(eval $(autotools-package))
