################################################################################
#
# python-librt
#
################################################################################

PYTHON_LIBRT_VERSION = 0.11.0
PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/40/08/9e7f6b5d2b5bed6ad055cdd5925f192bb403a51280f86b56554d9d0699a2
PYTHON_LIBRT_SETUP_TYPE = setuptools
PYTHON_LIBRT_LICENSE = MIT
PYTHON_LIBRT_LICENSE_FILES = LICENSE
PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1

$(eval $(python-package))
$(eval $(host-python-package))
