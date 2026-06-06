################################################################################
#
# dtc
#
################################################################################

DTC_VERSION = 1.8.1
DTC_SOURCE = dtc-$(DTC_VERSION).tar.xz
DTC_SITE = https://www.kernel.org/pub/software/utils/dtc
DTC_LICENSE = GPL-2.0+ or BSD-2-Clause (library)
DTC_LICENSE_FILES = README.license GPL BSD-2-Clause
DTC_CPE_ID_VALID = YES
DTC_INSTALL_STAGING = YES
DTC_DEPENDENCIES = host-bison host-flex host-pkgconf
HOST_DTC_DEPENDENCIES = host-bison host-flex host-pkgconf

DTC_CONF_OPTS = \
	-Dpython=disabled \
	-Dvalgrind=disabled \
	-Dtests=false

# For the host, we install headers in a special subdirectory to avoid
# conflicts with the in-kernel libfdt copy.
HOST_DTC_CONF_OPTS = \
	-Dpython=disabled \
	-Dvalgrind=disabled \
	-Dyaml=disabled
	-Dtests=false

ifeq ($(BR2_PACKAGE_LIBYAML),y)
    DTC_DEPENDENCIES += libyaml
    DTC_CONF_OPTS += -Dyaml=enabled
else
    DTC_CONF_OPTS += -Dyaml=disabled
endif

ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
    DTC_LICENSE += , GPL-2.0+ (programs)
    DTC_CONF_OPTS += -Dtools=true
else # $(BR2_PACKAGE_DTC_PROGRAMS) != y
    DTC_CONF_OPTS += -Dtools=false
endif # $(BR2_PACKAGE_DTC_PROGRAMS) != y

$(eval $(meson-package))
$(eval $(host-meson-package))
