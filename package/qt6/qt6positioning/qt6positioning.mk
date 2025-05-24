################################################################################
#
# qt6positioning
#
################################################################################

QT6POSITIONING_VERSION = $(QT6_VERSION)
QT6POSITIONING_SITE = $(QT6_SITE)
QT6POSITIONING_SOURCE = qtpositioning-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6POSITIONING_VERSION).tar.xz
QT6POSITIONING_INSTALL_STAGING = YES
QT6POSITIONING_SUPPORTS_IN_SOURCE_BUILD = NO
QT6POSITIONING_CMAKE_BACKEND = ninja

QT6POSITIONING_LICENSE = \
	GPL-2.0 or GPL-3.0 or LGPL-3.0, \
	BSL-1.0, \
	CC0-1.0, \
	GFDL-1.3 no invariants (docs), \
	GPL-3.0 with Qt-GPL-exception-1.0, \
	OFL-1.1 (TitilliumWeb), \
	BSD-3-Clause (examples + buildsystem)

QT6POSITIONING_LICENSE_FILES = \
	LICENSES/Apache-2.0.txt \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/BSL-1.0.txt \
	LICENSES/CC0-1.0.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/LicenseRef-Qt-Commercial.txt \
	LICENSES/MIT.txt \
	LICENSES/OFL-1.1.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

QT6POSITIONING_CONF_OPTS = \
	$(QT6_COMMON_CONF_OPTS) \
	-DQT_HOST_PATH=$(HOST_DIR)

QT6POSITIONING_DEPENDENCIES = qt6base

ifeq ($(BR2_PACKAGE_QT6DECLARATIVE)$(BR2_PACKAGE_QT6DECLARATIVE_QUICK),yy)
QT6POSITIONING_DEPENDENCIES += qt6declarative
endif

ifeq ($(BR2_PACKAGE_QT6SERIALPORT),y)
QT6POSITIONING_DEPENDENCIES += qt6serialport
endif

$(eval $(cmake-package))
