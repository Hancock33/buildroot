################################################################################
#
# python-multidict
#
################################################################################

PYTHON_MULTIDICT_VERSION = 7.1.0
PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
PYTHON_MULTIDICT_SITE = https://github.com/aio-libs/multidict/releases/download/v$(PYTHON_MULTIDICT_VERSION)
PYTHON_MULTIDICT_SETUP_TYPE = setuptools
PYTHON_MULTIDICT_LICENSE = Apache-2.0
PYTHON_MULTIDICT_LICENSE_FILES = LICENSE

$(eval $(python-package))
