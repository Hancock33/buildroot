################################################################################
#
# pcmanfm
#
################################################################################

PCMANFM_VERSION = 1.4.0
PCMANFM_SITE = $(call github,lxde,pcmanfm,$(PCMANFM_VERSION))
PCMANFM_DEPENDENCIES = libglib2 menu-cache libfm libgtk3 $(TARGET_NLS_DEPENDENCIES)
PCMANFM_LICENSE = GPL-2.0+
PCMANFM_LICENSE_FILES = COPYING
PCMANFM_CPE_ID_VALID = YES
PCMANFM_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
PCMANFM_CONF_OPTS = --with-gtk=3

define PCMANFM_AUTOCONFIG
	cd $(@D) && ./autogen.sh
endef
PCMANFM_PRE_CONFIGURE_HOOKS += PCMANFM_AUTOCONFIG

$(eval $(autotools-package))
