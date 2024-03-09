################################################################################
#
# pppd
#
################################################################################

# The tarball provided at https://download.samba.org/pub/ppp/ does not
# include the license files yet so we use the github tarball.
PPPD_VERSION = e1266c76d1ad39f98f11676e34f180f78c5a510c
PPPD_SITE = $(call github,ppp-project,ppp,$(PPPD_VERSION))
PPPD_LICENSE = LGPL-2.0+, LGPL, BSD-4-Clause, BSD-3-Clause, GPL-2.0+
PPPD_LICENSE_FILES = LICENSE.BSD LICENSE.GPL-2
PPPD_CPE_ID_VENDOR = point-to-point_protocol_project
PPPD_CPE_ID_PRODUCT = point-to-point_protocol
PPPD_SELINUX_MODULES = ppp
PPPD_AUTORECONF = YES
PPPD_INSTALL_STAGING = YES
PPPD_CONF_OPTS = --enable-multilink

ifeq ($(BR2_PACKAGE_OPENSSL),y)
PPPD_CONF_OPTS += \
	--enable-eaptls \
	--enable-openssl-engine \
	--enable-peap \
	--with-openssl=$(STAGING_DIR)/usr
PPPD_DEPENDENCIES += openssl
else
PPPD_CONF_OPTS += \
	--disable-eaptls \
	--disable-openssl-engine \
	--disable-peap \
	--without-openssl
endif

ifeq ($(BR2_PACKAGE_PPPD_FILTER),y)
PPPD_CONF_OPTS += --with-pcap=$(STAGING_DIR)/usr
PPPD_DEPENDENCIES += libpcap
else
PPPD_CONF_OPTS += --without-pcap
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
PPPD_CONF_OPTS += --enable-systemd
PPPD_DEPENDENCIES += systemd
else
PPPD_CONF_OPTS += --disable-systemd
endif

$(eval $(autotools-package))
