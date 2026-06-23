################################################################################
#
# python-vcs-versioning
#
################################################################################

PYTHON_VCS_VERSIONING_VERSION = 2.1.1
PYTHON_VCS_VERSIONING_SOURCE = vcs_versioning-$(PYTHON_VCS_VERSIONING_VERSION).tar.gz
PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/d6/ba/b64191fdd9b7a42a976ee465050d09b859c4cef75a56951266c6ab6ea96a
PYTHON_VCS_VERSIONING_SETUP_TYPE = setuptools
PYTHON_VCS_VERSIONING_LICENSE = MIT
PYTHON_VCS_VERSIONING_LICENSE_FILES = LICENSE.txt

$(eval $(host-python-package))
