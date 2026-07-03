################################################################################
#
# python-vcs-versioning
#
################################################################################


PYTHON_VCS_VERSIONING_VERSION = 2.2.2
PYTHON_VCS_VERSIONING_SOURCE = vcs_versioning-$(PYTHON_VCS_VERSIONING_VERSION).tar.gz
PYTHON_VCS_VERSIONING_SITE = https://files.pythonhosted.org/packages/09/95/c95bb74950763a163defcf4cedf6c5edfca1d623fd5031b76516ece85076
PYTHON_VCS_VERSIONING_SETUP_TYPE = setuptools
PYTHON_VCS_VERSIONING_LICENSE = MIT
PYTHON_VCS_VERSIONING_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
$(eval $(host-python-package))
