################################################################################
#
# qt6tools
#
################################################################################

QT6TOOLS_VERSION = $(QT6_VERSION)
QT6TOOLS_SITE = $(QT6_SITE)
QT6TOOLS_SOURCE = qttools-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6TOOLS_VERSION).tar.xz
QT6TOOLS_INSTALL_STAGING = YES
QT6TOOLS_SUPPORTS_IN_SOURCE_BUILD = NO
QT6TOOLS_CMAKE_BACKEND = ninja

QT6TOOLS_LICENSE = \
	GPL-2.0+ or LGPL-3.0, \
	GPL-3.0 with exception (tools), \
	GFDL-1.3 (docs), \
	BSD-3-Clause

QT6TOOLS_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/Qt-GPL-exception-1.0.txt

QT6TOOLS_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	$(QT6_COMMON_CONF_OPTS) \
	-DFEATURE_assistant=FALSE \
	-DFEATURE_designer=FALSE

QT6TOOLS_DEPENDENCIES = \
	host-pkgconf \
	host-qt6tools \
	qt6base

HOST_QT6TOOLS_CONF_OPTS = \
	-DFEATURE_assistant=FALSE \
	-DFEATURE_clang=FALSE \
	-DFEATURE_clangcpp=FALSE \
	-DFEATURE_designer=FALSE \
	-DFEATURE_distancefieldgenerator=FALSE \
	-DFEATURE_kmap2qmap=FALSE \
	-DFEATURE_linguist=TRUE \
	-DFEATURE_pixeltool=FALSE \
	-DFEATURE_qdbus=FALSE \
	-DFEATURE_qev=FALSE \
	-DFEATURE_qtattributionsscanner=TRUE \
	-DFEATURE_qtdiag=FALSE \
	-DFEATURE_qtplugininfo=FALSE

HOST_QT6TOOLS_CONF_OPTS = \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF

HOST_QT6TOOLS_DEPENDENCIES = host-qt6base

ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_LINGUIST_TOOLS),y)
HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=ON
# When we have qt6declarative for the target, we need to build the
# linguist tool with host-qt6declarative support so that it handles
# QML/JS files
ifeq ($(BR2_PACKAGE_QT6DECLARATIVE),y)
HOST_QT6TOOLS_DEPENDENCIES += host-qt6declarative
endif
else
HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_linguist=OFF
endif

$(eval $(cmake-package))
$(eval $(host-cmake-package))
