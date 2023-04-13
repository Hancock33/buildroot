################################################################################
#
# qt5svg
#
################################################################################

QT5SVG_VERSION = $(QT5_VERSION)
QT5SVG_SITE = $(QT5_SITE)
QT5SVG_SOURCE = qtsvg-everywhere-opensource-src-$(QT5_VERSION).tar.xz
QT5SVG_INSTALL_STAGING = YES
QT5SVG_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5SVG_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPLv3 LICENSE.LGPLv3 LICENSE.FDL
QT5SVG_SYNC_QT_HEADERS = YES

$(eval $(qmake-package))
