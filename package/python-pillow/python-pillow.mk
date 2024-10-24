################################################################################
#
# python-pillow
#
################################################################################

PYTHON_PILLOW_VERSION = 11.0.0
PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/a5/26/0d95c04c868f6bdb0c447e3ee2de5564411845e36a858cfd63766bc7b563
PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
PYTHON_PILLOW_LICENSE = HPND
PYTHON_PILLOW_LICENSE_FILES = LICENSE
PYTHON_PILLOW_CPE_ID_VENDOR = python
PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
PYTHON_PILLOW_SETUP_TYPE = setuptools

PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
PYTHON_PILLOW_BUILD_OPTS = -C--build-option=build_ext -C--build-option=--disable-platform-guessing

ifeq ($(BR2_PACKAGE_FREETYPE),y)
PYTHON_PILLOW_DEPENDENCIES += freetype
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-freetype
else
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-freetype
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
PYTHON_PILLOW_DEPENDENCIES += jpeg
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg
else
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg
endif

ifeq ($(BR2_PACKAGE_LCMS2),y)
PYTHON_PILLOW_DEPENDENCIES += lcms2
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-lcms
else
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-lcms
endif

ifeq ($(BR2_PACKAGE_LIBXCB),y)
PYTHON_PILLOW_DEPENDENCIES += libxcb
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-xcb
else
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-xcb
endif

ifeq ($(BR2_PACKAGE_OPENJPEG),y)
PYTHON_PILLOW_DEPENDENCIES += openjpeg
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-jpeg2000
else
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-jpeg2000
endif

ifeq ($(BR2_PACKAGE_TIFF),y)
PYTHON_PILLOW_DEPENDENCIES += tiff
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--enable-tiff
else
PYTHON_PILLOW_BUILD_OPTS += -C--build-option=--disable-tiff
endif

$(eval $(python-package))
