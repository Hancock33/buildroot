################################################################################
#
# rpm
#
################################################################################

RPM_VERSION_MAJOR = 4.19
RPM_VERSION = $(RPM_VERSION_MAJOR).1.1
RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
RPM_DEPENDENCIES = \
	host-pkgconf \
	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
	$(if $(BR2_PACKAGE_ELFUTILS),elfutils) \
	file \
	lua \
	popt \
	$(if $(BR2_PACKAGE_XZ),xz) \
	zlib \
	$(TARGET_NLS_DEPENDENCIES)
RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
RPM_LICENSE_FILES = COPYING
RPM_CPE_ID_VENDOR = rpm
RPM_SELINUX_MODULES = rpm

RPM_INSTALL_STAGING = YES

RPM_CONF_OPTS = \
	-DWITH_FSVERITY=OFF \
	-DWITH_FAPOLICYD=OFF \
	-DWITH_IMAEVM=OFF \
	-DENABLE_TESTSUITE=OFF

# use deprecated openpgp implementation instead of rpm-sequoia,
# because otherwise we need to use a rust library, which is not yet
# supported by cargo-package infrastructure
RPM_CONF_OPTS += -DWITH_INTERNAL_OPENPGP=ON

ifeq ($(BR2_TOOLCHAIN_HAS_OPENMP),y)
RPM_CONF_OPTS += -DENABLE_OPENMP=ON
else
RPM_CONF_OPTS += -DENABLE_OPENMP=OFF
endif

ifeq ($(BR2_PACKAGE_ACL),y)
RPM_DEPENDENCIES += acl
RPM_CONF_OPTS += -DWITH_ACL=ON
else
RPM_CONF_OPTS += -DWITH_ACL=OFF
endif

ifeq ($(BR2_PACKAGE_AUDIT),y)
RPM_DEPENDENCIES += audit
RPM_CONF_OPTS += -DWITH_AUDIT=ON
else
RPM_CONF_OPTS += -DWITH_AUDIT=OFF
endif

ifeq ($(BR2_PACKAGE_DBUS),y)
RPM_DEPENDENCIES += dbus
RPM_CONF_OPTS += -DWITH_DBUS=ON
else
RPM_CONF_OPTS += -DWITH_DBUS=OFF
endif

ifeq ($(BR2_PACKAGE_LIBCAP),y)
RPM_DEPENDENCIES += libcap
RPM_CONF_OPTS += -DWITH_CAP=ON
else
RPM_CONF_OPTS += -DWITH_CAP=OFF
endif

ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
RPM_DEPENDENCIES += libgcrypt
RPM_CONF_OPTS += -DWITH_OPENSSL=OFF
else
RPM_DEPENDENCIES += openssl
RPM_CONF_OPTS += -DWITH_OPENSSL=ON
endif

ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
RPM_DEPENDENCIES += libselinux
RPM_CONF_OPTS += -DWITH_SELINUX=ON
else
RPM_CONF_OPTS += -DWITH_SELINUX=OFF
endif

ifeq ($(BR2_PACKAGE_PYTHON3),y)
RPM_DEPENDENCIES += python3
RPM_CONF_OPTS += -DENABLE_PYTHON=ON
else
RPM_CONF_OPTS += -DENABLE_PYTHON=OFF
endif

ifeq ($(BR2_PACKAGE_READLINE),y)
RPM_DEPENDENCIES += readline
RPM_CONF_OPTS += -DWITH_READLINE=ON
else
RPM_CONF_OPTS += -DWITH_READLINE=OFF
endif

ifeq ($(BR2_PACKAGE_SQLITE),y)
RPM_DEPENDENCIES += sqlite
RPM_CONF_OPTS += -DENABLE_SQLITE=ON
else
RPM_CONF_OPTS += -DENABLE_SQLITE=OFF
endif

ifeq ($(BR2_PACKAGE_RPM_RPM2ARCHIVE),y)
RPM_DEPENDENCIES += libarchive
RPM_CONF_OPTS += -DWITH_ARCHIVE=ON
else
RPM_CONF_OPTS += -DWITH_ARCHIVE=OFF
endif

# ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
RPM_CONF_ENV = \
	ac_cv_prog_cc_c99='-std=gnu99' \
	LIBS=$(TARGET_NLS_LIBS)

$(eval $(cmake-package))
