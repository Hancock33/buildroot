################################################################################
#
# python-tzdata
#
################################################################################

PYTHON_TZDATA_VERSION = 2024.1
PYTHON_TZDATA_SOURCE = tzdata-$(PYTHON_TZDATA_VERSION).tar.gz
PYTHON_TZDATA_SITE = https://files.pythonhosted.org/packages/74/5b/e025d02cb3b66b7b76093404392d4b44343c69101cc85f4d180dd5784717
PYTHON_TZDATA_SETUP_TYPE = setuptools
PYTHON_TZDATA_LICENSE = Apache-2.0
PYTHON_TZDATA_LICENSE_FILES = LICENSE

$(eval $(python-package))
