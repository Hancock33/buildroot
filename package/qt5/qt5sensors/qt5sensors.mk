################################################################################
#
# qt5sensors
#
################################################################################

QT5SENSORS_VERSION = $(QT5_VERSION)
QT5SENSORS_SITE = $(QT5_SITE)
QT5SENSORS_SOURCE = qtsensors-everywhere-opensource-src-$(QT5_VERSION).tar.xz
QT5SENSORS_INSTALL_STAGING = YES
QT5SENSORS_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception(tools), GFDL-1.3 (docs)
QT5SENSORS_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
QT5SENSORS_SYNC_QT_HEADERS = YES

ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
QT5SENSORS_DEPENDENCIES += qt5declarative
endif

$(eval $(qmake-package))
