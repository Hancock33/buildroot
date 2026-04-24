################################################################################
#
# python-pathspec
#
################################################################################

PYTHON_PATHSPEC_VERSION = 1.1.0
PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/2e/17/9c3094b822982b9f1ea666d8580ce59000f61f87c1663556fb72031ad9ec
PYTHON_PATHSPEC_LICENSE = MPL-2.0
PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
PYTHON_PATHSPEC_SETUP_TYPE = flit

$(eval $(python-package))
$(eval $(host-python-package))
