################################################################################
#
# spdlog
#
################################################################################
# Version: Commits on May 30, 2023
SPDLOG_VERSION = 31cf79a70dfa61a4b2b7509eecca6a3b269bfc4a
SPDLOG_SITE = $(call github,gabime,spdlog,$(SPDLOG_VERSION))
SPDLOG_LICENSE = MIT
SPDLOG_LICENSE_FILES = LICENSE
SPDLOG_INSTALL_STAGING = YES
SPDLOG_DEPENDENCIES = fmt
SPDLOG_CONF_OPTS += \
	-DSPDLOG_BUILD_TESTS=OFF \
	-DSPDLOG_BUILD_EXAMPLE=OFF \
	-DSPDLOG_BUILD_BENCH=OFF \
	-DSPDLOG_FMT_EXTERNAL=ON

ifeq ($(BR2_STATIC_LIBS),y)
SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=OFF
else
SPDLOG_CONF_OPTS += -DSPDLOG_BUILD_SHARED=ON
endif

$(eval $(cmake-package))
