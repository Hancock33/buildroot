################################################################################
#
# python-librt
#
################################################################################

PYTHON_LIBRT_VERSION = 0.17.0
PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/ed/82/9b31a8cd0fe33fde43132f43d2dab766976afc0d3d0763ea6082c4385b22
PYTHON_LIBRT_SETUP_TYPE = setuptools
PYTHON_LIBRT_LICENSE = MIT
PYTHON_LIBRT_LICENSE_FILES = LICENSE
PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1
HOST_PYTHON_LIBRT_DEPENDENCIES = host-python-mypy-extensions

$(eval $(python-package))
$(eval $(host-python-package))
