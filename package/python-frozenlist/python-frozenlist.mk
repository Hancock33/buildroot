################################################################################
#
# python-frozenlist
#
################################################################################

PYTHON_FROZENLIST_VERSION = 1.6.2
PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/5b/bf/a812e2fe6cb3f6c6cfc8d0303bf1742f2286004e5ec41ac8c89cf68cdb54
PYTHON_FROZENLIST_SETUP_TYPE = pep517
PYTHON_FROZENLIST_LICENSE = Apache-2.0
PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
PYTHON_FROZENLIST_DEPENDENCIES = \
	host-python-expandvars \
	host-python-setuptools
# C code generation required Cython 3 which we don't have in Buildroot yet.
PYTHON_FROZENLIST_BUILD_OPTS = -C=pure-python=true

$(eval $(python-package))
