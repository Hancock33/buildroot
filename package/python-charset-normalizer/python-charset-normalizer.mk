################################################################################
#
# python-charset-normalizer
#
################################################################################

PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.9
PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/bd/2a/23f34ec9d04624958e137efdc394888716353190e75f25dd22c7a2c7a8aa
PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1

$(eval $(python-package))
$(eval $(host-python-package))
