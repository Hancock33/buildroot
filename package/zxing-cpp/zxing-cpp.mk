################################################################################
#
# zxing-cpp
#
################################################################################

ZXING_CPP_VERSION = 2.0.0
ZXING_CPP_SITE = $(call github,zxing-cpp,zxing-cpp,v$(ZXING_CPP_VERSION))
ZXING_CPP_LICENSE = Apache-2.0
ZXING_CPP_LICENSE_FILES = LICENSE
ZXING_CPP_INSTALL_STAGING = YES
ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
ZXING_CPP_DEPENDENCIES = host-pkgconf stb
ZXING_CPP_CONF_OPTS = \
	-DBUILD_READERS=ON \
	-DBUILD_WRITERS=ON \
	-DBUILD_EXAMPLES=OFF \
	-DBUILD_BLACKBOX_TESTS=OFF \
	-DBUILD_UNIT_TESTS=OFF \
	-DBUILD_DEPENDENCIES=LOCAL

ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV4_LIB_HIGHGUI),y)
ifeq ($(BR2_PACKAGE_OPENCV3),y)
ZXING_CPP_DEPENDENCIES += opencv3
endif
ifeq ($(BR2_PACKAGE_OPENCV4),y)
ZXING_CPP_DEPENDENCIES += opencv4
endif
ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_OpenCV=TRUE
else
ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_OpenCV=TRUE
endif

ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
ZXING_CPP_DEPENDENCIES += python3 python-pybind
ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=ON
else
ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
endif

ifeq ($(BR2_PACKAGE_QT5BASE),y)
ZXING_CPP_DEPENDENCIES += qt5base
ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yy)
ZXING_CPP_DEPENDENCIES += qt5declarative qt5multimedia
endif
# Only set qt5 as required when all optional qt5 dependencies are present
ifeq ($(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5MULTIMEDIA),yyy)
ZXING_CPP_CONF_OPTS += -DCMAKE_REQUIRE_FIND_PACKAGE_Qt5=TRUE
endif
else
ZXING_CPP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_Qt5=TRUE
endif

$(eval $(cmake-package))
