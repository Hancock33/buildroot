################################################################################
#
# python-librt
#
################################################################################

PYTHON_LIBRT_VERSION = 0.8.0
PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/8a/3f/4ca7dd7819bf8ff303aca39c3c60e5320e46e766ab7f7dd627d3b9c11bdf
PYTHON_LIBRT_SETUP_TYPE = setuptools
PYTHON_LIBRT_LICENSE = MIT
PYTHON_LIBRT_LICENSE_FILES = LICENSE
PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1

$(eval $(python-package))
$(eval $(host-python-package))
