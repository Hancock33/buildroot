################################################################################
#
# python-frozenlist
#
################################################################################

PYTHON_FROZENLIST_VERSION = 1.6.0
PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/ee/f4/d744cba2da59b5c1d88823cf9e8a6c74e4659e2b27604ed973be2a0bf5ab
PYTHON_FROZENLIST_SETUP_TYPE = pep517
PYTHON_FROZENLIST_LICENSE = Apache-2.0
PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
PYTHON_FROZENLIST_DEPENDENCIES = \
	host-python-expandvars \
	host-python-setuptools
# C code generation required Cython 3 which we don't have in Buildroot yet.
PYTHON_FROZENLIST_BUILD_OPTS = -C=pure-python=true

$(eval $(python-package))
