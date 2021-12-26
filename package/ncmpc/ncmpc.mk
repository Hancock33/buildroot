################################################################################
#
# ncmpc
#
################################################################################

NCMPC_VERSION_MAJOR = 0
NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).46
NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
NCMPC_DEPENDENCIES = \
	host-pkgconf \
	libmpdclient \
	ncurses \
	$(TARGET_NLS_DEPENDENCIES)
NCMPC_LICENSE = GPL-2.0+
NCMPC_LICENSE_FILES = COPYING
NCMPC_CPE_ID_VENDOR = ncmpc_project

NCMPC_CONF_OPTS = \
	-Dcurses=ncurses \
	-Ddocumentation=disabled \
	$(if $(BR2_SYSTEM_ENABLE_NLS),-Dnls=enabled,-Dnls=disabled) \
	$(if $(BR2_TOOLCHAIN_HAS_THREADS),-Dsignalfd=true,-Dsignalfd=false)

ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
NCMPC_DEPENDENCIES += lirc-tools
NCMPC_CONF_OPTS += -Dlirc=enabled
else
NCMPC_CONF_OPTS += -Dlirc=disabled
endif

ifeq ($(BR2_PACKAGE_PCRE2),y)
NCMPC_DEPENDENCIES += pcre2
NCMPC_CONF_OPTS += -Dregex=enabled
else
NCMPC_CONF_OPTS += -Dregex=disabled
endif

$(eval $(meson-package))
