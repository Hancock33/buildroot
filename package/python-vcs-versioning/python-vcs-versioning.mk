################################################################################
#
# python-vcs-versioning
#
################################################################################

PYTHON_VCS_VERSIONING_VERSION = 1.1.1
PYTHON_VCS_VERSIONING_SOURCE = vcs_versioning-$(PYTHON_VCS_VERSIONING_VERSION).tar.gz
PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/49/42/d97a7795055677961c63a1eef8e7b19d5968ed992ed3a70ab8eb012efad8
PYTHON_VCS_VERSIONING_SETUP_TYPE = setuptools
PYTHON_VCS_VERSIONING_LICENSE = LGPL-3.0

$(eval $(host-python-package))
