################################################################################
#
# python-librt
#
################################################################################

PYTHON_LIBRT_VERSION = 0.7.8
PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/e7/24/5f3646ff414285e0f7708fa4e946b9bf538345a41d1c375c439467721a5e
PYTHON_LIBRT_SETUP_TYPE = setuptools
PYTHON_LIBRT_LICENSE = MIT
PYTHON_LIBRT_LICENSE_FILES = LICENSE
PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1

$(eval $(python-package))
$(eval $(host-python-package))
