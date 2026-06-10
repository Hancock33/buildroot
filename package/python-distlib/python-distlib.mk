################################################################################
#
# python-distlib
#
################################################################################

PYTHON_DISTLIB_VERSION = 0.4.2
PYTHON_DISTLIB_SOURCE = distlib-$(PYTHON_DISTLIB_VERSION).tar.gz
PYTHON_DISTLIB_SITE = https://files.pythonhosted.org/packages/46/8d/873e9252ea2c0e0c857884e0a2899ec43ade132345df1925ef24cbe64f18
PYTHON_DISTLIB_SETUP_TYPE = setuptools
PYTHON_DISTLIB_LICENSE = PSF-2.0
PYTHON_DISTLIB_LICENSE_FILES = LICENSE.txt

$(eval $(host-python-package))
