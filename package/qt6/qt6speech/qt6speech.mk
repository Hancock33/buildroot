################################################################################
#
# qt6speech
#
################################################################################

QT6SPEECH_VERSION = $(QT6_VERSION)
QT6SPEECH_SITE = $(QT6_SITE)
QT6SPEECH_SOURCE = qtspeech-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SPEECH_VERSION).tar.xz
QT6SPEECH_INSTALL_STAGING = YES
QT6SPEECH_SUPPORTS_IN_SOURCE_BUILD = NO
QT6SPEECH_CMAKE_BACKEND = ninja
QT6SPEECH_LICENSE = LGPL-3.0 or GPL-2.0

QT6SPEECH_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/LicenseRef-Qt-Commercial.txt

QT6SPEECH_CONF_OPTS = \
	$(QT6_COMMON_CONF_OPTS) \
	-DQT_HOST_PATH=$(HOST_DIR)

QT6SPEECH_DEPENDENCIES = \
	qt6base \
	qt6multimedia

ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
QT6SPEECH_DEPENDENCIES += qt6declarative
endif

$(eval $(cmake-package))
