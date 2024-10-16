################################################################################
#
# libsoundtouch
#
################################################################################

LIBSOUNDTOUCH_VERSION = 2.3.3
LIBSOUNDTOUCH_SOURCE = soundtouch-$(LIBSOUNDTOUCH_VERSION).tar.gz
LIBSOUNDTOUCH_SITE = https://www.surina.net/soundtouch
LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
LIBSOUNDTOUCH_INSTALL_STAGING = YES

LIBSOUNDTOUCH_CONF_OPTS += -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
LIBSOUNDTOUCH_CONF_OPTS += -DSOUNDTOUCH_DLL=ON

$(eval $(cmake-package))
