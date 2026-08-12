################################################################################
#
# python-charset-normalizer
#
################################################################################

PYTHON_CHARSET_NORMALIZER_VERSION = 3.5.0
PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/cb/31/4971872b3ed8715346231fb6eb4da8fcba65a4143c189db151ee28a2812b
PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = pep517
PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1

$(eval $(python-package))
$(eval $(host-python-package))
