################################################################################
#
# qt5declarative
#
################################################################################

QT5DECLARATIVE_VERSION = $(QT5_VERSION)
QT5DECLARATIVE_SITE = $(QT5_SITE)
QT5DECLARATIVE_SOURCE = qtdeclarative-everywhere-opensource-src-$(QT5_VERSION).tar.xz
QT5DECLARATIVE_INSTALL_STAGING = YES
QT5DECLARATIVE_SYNC_QT_HEADERS = YES

QT5DECLARATIVE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5DECLARATIVE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL

$(eval $(qmake-package))
