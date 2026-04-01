################################################################################
#
# python-mypy
#
################################################################################

PYTHON_MYPY_VERSION = 1.20.0
PYTHON_MYPY_SOURCE = mypy-$(PYTHON_MYPY_VERSION).tar.gz
PYTHON_MYPY_SITE = https://files.pythonhosted.org/packages/f8/5c/b0089fe7fef0a994ae5ee07029ced0526082c6cfaaa4c10d40a10e33b097
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
