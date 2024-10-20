################################################################################
#
# qt6languageserver
#
################################################################################

QT6LANGUAGESERVER_VERSION = $(QT6_VERSION)
QT6LANGUAGESERVER_SITE = $(QT6_SITE)
QT6LANGUAGESERVER_SOURCE = qtlanguageserver-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6LANGUAGESERVER_VERSION).tar.xz
QT6LANGUAGESERVER_INSTALL_STAGING = YES
QT6LANGUAGESERVER_SUPPORTS_IN_SOURCE_BUILD = NO

QT6LANGUAGESERVER_CMAKE_BACKEND = ninja

QT6LANGUAGESERVER_LICENSE = \
	GPL-2.0 or LGPL-3.0 or GPL-3.0, \
	GPL-3.0 (tests)

QT6LANGUAGESERVER_LICENSE_FILES = \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt

QT6LANGUAGESERVER_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	$(QT6_COMMON_CONF_OPTS)

QT6LANGUAGESERVER_DEPENDENCIES = \
	qt6base

$(eval $(cmake-package))
