################################################################################
#
# python-mypy
#
################################################################################

PYTHON_MYPY_VERSION = 2.1.0
PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/82/15/cca9d88503549ed6fedeaa1d448cdddd542ee8a490232d732e278036fbf2
PYTHON_MYPY_SETUP_TYPE = setuptools
PYTHON_MYPY_LICENSE = Apache-2.0, BSD-2-Clause, Python-2.0.1
PYTHON_MYPY_LICENSE_FILES = LICENSE
PYTHON_MYPY_DEPENDENCIES = \
	host-python-librt \
	host-python-mypy-extensions \
	host-python-pathspec \
	host-python-types-psutil \
	host-python-types-setuptools \
	host-python-typing-extensions
HOST_PYTHON_MYPY_DEPENDENCIES = \
	host-python-librt \
	host-python-mypy-extensions \
	host-python-pathspec \
	host-python-types-psutil \
	host-python-types-setuptools \
	host-python-typing-extensions

$(eval $(python-package))
$(eval $(host-python-package))
