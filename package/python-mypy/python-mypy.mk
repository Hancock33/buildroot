################################################################################
#
# python-mypy
#
################################################################################

PYTHON_MYPY_VERSION = 1.20.2
PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/04/af/e3d4b3e9ec91a0ff9aabfdb38692952acf49bbb899c2e4c29acb3a6da3ae
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
