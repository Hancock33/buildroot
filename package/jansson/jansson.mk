################################################################################
#
# jansson
#
################################################################################

JANSSON_VERSION = 2.15.1
JANSSON_SOURCE = jansson-$(JANSSON_VERSION).tar.bz2
JANSSON_SITE = \
	https://github.com/akheron/jansson/releases/download/v$(JANSSON_VERSION)
JANSSON_LICENSE = MIT
JANSSON_LICENSE_FILES = LICENSE
JANSSON_CPE_ID_VALID = YES
JANSSON_INSTALL_STAGING = YES

JANSSON_CONF_OPTS = -DJANSSON_EXAMPLES=OFF
JANSSON_CONF_OPTS = -DJANSSON_BUILD_DOCS=OFF

ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
JANSSON_CONF_OPTS += -DJANSSON_BUILD_SHARED_LIBS=ON
else
JANSSON_CONF_OPTS += -DJANSSON_BUILD_SHARED_LIBS=OFF
endif

$(eval $(cmake-package))
