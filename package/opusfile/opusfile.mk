################################################################################
#
# opusfile
#
################################################################################
# Version: Commits on Mar 28, 2026
OPUSFILE_VERSION = 6dfd29e7adb87f2e193575fc3fa88cbf1a0b27df
OPUSFILE_SITE = $(call github,xiph,opusfile,$(OPUSFILE_VERSION))
OPUSFILE_DEPENDENCIES = host-pkgconf libogg opus
OPUSFILE_LICENSE = BSD-3-Clause
OPUSFILE_LICENSE_FILES = COPYING
OPUSFILE_CPE_ID_VENDOR = xiph
OPUSFILE_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_OPENSSL),y)
OPUSFILE_DEPENDENCIES += openssl
OPUSFILE_CONF_OPTS += -DOP_DISABLE_HTTP=ON
endif

# Use the same as opus package since it's a dep and we can't mix
ifeq ($(BR2_PACKAGE_OPUS_FIXED_POINT),y)
OPUSFILE_CONF_OPTS += -DOP_FIXED_POINT=ON
endif

$(eval $(cmake-package))
