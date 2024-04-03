################################################################################
#
# xserver_xorg-server
#
################################################################################

XSERVER_XORG_SERVER_VERSION = 21.1.12
XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.gz
XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
XSERVER_XORG_SERVER_SITE_METHOD=git
XSERVER_XORG_SERVER-GIT_SUBMODULES=YES
XSERVER_XORG_SERVER_LICENSE = MIT
XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
XSERVER_XORG_SERVER_CPE_ID_VENDOR = x.org
XSERVER_XORG_SERVER_CPE_ID_PRODUCT = xorg-server
XSERVER_XORG_SERVER_SELINUX_MODULES = xdg xserver
XSERVER_XORG_SERVER_INSTALL_STAGING = YES

XSERVER_XORG_SERVER_DEPENDENCIES = \
	xutil_util-macros \
	xlib_libX11 \
	xlib_libXau \
	xlib_libXdmcp \
	xlib_libXext \
	xlib_libXfixes \
	xlib_libXfont2 \
	xlib_libXi \
	xlib_libXrender \
	xlib_libXres \
	xlib_libXft \
	xlib_libXcursor \
	xlib_libXinerama \
	xlib_libXrandr \
	xlib_libXdamage \
	xlib_libXxf86vm \
	xlib_libxkbfile \
	xlib_libxcvt \
	xlib_xtrans \
	xdata_xbitmaps \
	xorgproto \
	xkeyboard-config \
	pixman \
	mcookie \
	host-pkgconf

# We force -O2 regardless of the optimization level chosen by the
# user, as the X.org server is known to trigger some compiler bugs at
# -Os on several architectures.
XSERVER_XORG_SERVER_CONF_OPTS = \
	-Ddocs=false \
	-Dhal=false \
	-Dxnest=false \
	-Dbuilder_addr=buildroot@buildroot.org \
	-Ddefault_font_path=/usr/share/fonts/X11/

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR),y)
	-Dxephyr=true
else
	-Dxephyr=false
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),y)
	-Dxvfb=true
else
	-Dxvfb=false
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
XSERVER_XORG_SERVER_CONF_OPTS += \
	-Dsystemd_logind=true
XSERVER_XORG_SERVER_DEPENDENCIES += \
	systemd
else
XSERVER_XORG_SERVER_CONF_OPTS += \
	-Dsystemd_logind=false
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
XSERVER_XORG_SERVER_CONF_OPTS += -Dxorg=true
XSERVER_XORG_SERVER_DEPENDENCIES += libpciaccess
ifeq ($(BR2_PACKAGE_LIBDRM),y)
XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
XSERVER_XORG_SERVER_CONF_OPTS += -Ddrm=true
else
XSERVER_XORG_SERVER_CONF_OPTS += -Ddrm=false
endif
else
XSERVER_XORG_SERVER_CONF_OPTS += -Dxorg=false
endif

ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
XSERVER_XORG_SERVER_CONF_OPTS += -Dglx=true
XSERVER_XORG_SERVER_DEPENDENCIES += libgl
else
XSERVER_XORG_SERVER_CONF_OPTS +=  -Dglx=false
endif

# Optional packages
ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
XSERVER_XORG_SERVER_DEPENDENCIES += udev
XSERVER_XORG_SERVER_CONF_OPTS += -Dudev=true
# udev kms support depends on libdrm and dri2
ifeq ($(BR2_PACKAGE_LIBDRM),y)
XSERVER_XORG_SERVER_CONF_OPTS += -Dudev_kms=true
else
XSERVER_XORG_SERVER_CONF_OPTS += -Dudev_kms=false
endif
endif

ifeq ($(BR2_PACKAGE_FREETYPE),y)
XSERVER_XORG_SERVER_DEPENDENCIES += freetype
endif

ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
XSERVER_XORG_SERVER_DEPENDENCIES += libunwind
XSERVER_XORG_SERVER_CONF_OPTS += -Dlibunwind=true
else
XSERVER_XORG_SERVER_CONF_OPTS += -Dlibunwind=false
endif

ifneq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
XSERVER_XORG_SERVER_CONF_OPTS += -Dxvmc=false
endif

ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR),y)
XSERVER_XORG_SERVER_CONF_OPTS += -Ddri2=true
ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence
XSERVER_XORG_SERVER_CONF_OPTS += -Ddri3=true
ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
XSERVER_XORG_SERVER_CONF_OPTS += -Dglamor=true
else
XSERVER_XORG_SERVER_CONF_OPTS += -Dglamor=false
endif
else
XSERVER_XORG_SERVER_CONF_OPTS += -Ddri3=false -Dglamor=false
endif
else
XSERVER_XORG_SERVER_CONF_OPTS += -Ddri2=false -Ddri3=false -Dglamor=false
endif

ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libXScrnSaver
XSERVER_XORG_SERVER_CONF_OPTS += -Dscreensaver=true
else
XSERVER_XORG_SERVER_CONF_OPTS += -Dscreensaver=false
endif

ifeq ($(BR2_PACKAGE_OPENSSL),y)
XSERVER_XORG_SERVER_CONF_OPTS += -Dsha1=libcrypto
XSERVER_XORG_SERVER_DEPENDENCIES += openssl
else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
XSERVER_XORG_SERVER_CONF_OPTS += -Dsha1=libgcrypt
XSERVER_XORG_SERVER_DEPENDENCIES += libgcrypt
else
XSERVER_XORG_SERVER_CONF_OPTS += -Dsha1=libsha1
XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
endif

# Install the systemd unit only when nodm nor xdm aren't enabled, as
# they would be responsible for starting the server.
ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
	$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
endef
endif

# Install the init script only when neither nodm nor xdm are enabled, as
# they would be responsible for starting the server.
ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
		$(TARGET_DIR)/etc/init.d/S40xorg
endef
endif

$(eval $(meson-package))
