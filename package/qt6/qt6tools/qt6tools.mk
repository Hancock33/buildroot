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
	-GNinja \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DBUILD_WITH_PCH=OFF \
	-DQT_BUILD_EXAMPLES=OFF \
	-DQT_BUILD_TESTS=OFF \
	-DFEATURE_assistant=FALSE \
	-DFEATURE_designer=FALSE

QT6TOOLS_DEPENDENCIES = \
	host-pkgconf \
	host-ninja \
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
	-DFEATURE_qtattributionsscanner=FALSE \
	-DFEATURE_qtdiag=FALSE \
	-DFEATURE_qtplugininfo=FALSE

define QT6TOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6TOOLS_BUILDDIR)
endef

define QT6TOOLS_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(QT6TOOLS_BUILDDIR)
endef

define QT6TOOLS_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(QT6TOOLS_BUILDDIR)
endef

$(eval $(cmake-package))
$(eval $(host-cmake-package))
