################################################################################
#
# qt6
#
################################################################################

QT6_VERSION_MAJOR = 6.5
QT6_VERSION = $(QT6_VERSION_MAJOR).1
QT6_SOURCE_TARBALL_PREFIX = everywhere-src
QT6_SITE = https://download.qt.io/archive/qt/$(QT6_VERSION_MAJOR)/$(QT6_VERSION)/submodules

QT6_COMMON_CONF_OPTS = \
    -DINSTALL_ARCHDATADIR=/usr/lib/qt6 \
    -DINSTALL_DATADIR=/usr/share/qt6 \
    -DINSTALL_MKSPECSDIR=/usr/lib/qt6/mkspecs \
    -DBUILD_WITH_PCH=OFF \
    -DQT_BUILD_EXAMPLES=OFF \
    -DQT_BUILD_TESTS=OFF
    -DQT_BUILD_TESTS_BY_DEFAULT=OFF \
    -DQT_BUILD_EXAMPLES_BY_DEFAULT=OFF

include $(sort $(wildcard package/qt6/*/*.mk))
