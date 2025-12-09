################################################################################
#
# irqbalance
#
################################################################################

IRQBALANCE_VERSION = 1.9.5
IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
IRQBALANCE_LICENSE = GPL-2.0
IRQBALANCE_LICENSE_FILES = COPYING
IRQBALANCE_SELINUX_MODULES = irqbalance
IRQBALANCE_DEPENDENCIES = host-pkgconf libglib2

IRQBALANCE_CONF_ENV += \
	CFLAGS="$(IRQBALANCE_CFLAGS)"

ifeq ($(BR2_PACKAGE_LIBCAP_NG),y)
IRQBALANCE_DEPENDENCIES += libcap-ng
IRQBALANCE_CONF_OPTS += -Dcapng=enabled
else
IRQBALANCE_CONF_OPTS += -Dcapng=disabled
endif

ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
IRQBALANCE_DEPENDENCIES += ncurses
IRQBALANCE_CONF_OPTS += -Dui=enabled
else
IRQBALANCE_CONF_OPTS += -Dui=disabled
endif

ifeq ($(BR2_PACKAGE_NUMACTL),y)
IRQBALANCE_DEPENDENCIES += numactl
IRQBALANCE_CONF_OPTS += -Dnuma=enabled
else
IRQBALANCE_CONF_OPTS += -Dnuma=disabled
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
IRQBALANCE_DEPENDENCIES += systemd
IRQBALANCE_CONF_OPTS += -Dsystemd=enabled
IRQBALANCE_CONF_OPTS += -Dsystemd-service=false
else
IRQBALANCE_CONF_OPTS += -Dsystemd=disabled
IRQBALANCE_CONF_OPTS += -Dsystemd-service=false
endif

define IRQBALANCE_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/irqbalance/S13irqbalance \
		$(TARGET_DIR)/etc/init.d/S13irqbalance
endef

define IRQBALANCE_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 644 package/irqbalance/irqbalance.service \
		$(TARGET_DIR)/usr/lib/systemd/system/irqbalance.service
endef

$(eval $(meson-package))
