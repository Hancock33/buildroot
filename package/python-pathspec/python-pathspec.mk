################################################################################
#
# python-pathspec
#
################################################################################

PYTHON_PATHSPEC_VERSION = 1.0.2
PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/41/b9/6eb731b52f132181a9144bbe77ff82117f6b2d2fbfba49aaab2c014c4760
PYTHON_PATHSPEC_LICENSE = MPL-2.0
PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
PYTHON_PATHSPEC_SETUP_TYPE = flit

$(eval $(python-package))
$(eval $(host-python-package))
