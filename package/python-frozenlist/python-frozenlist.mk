################################################################################
#
# python-frozenlist
#
################################################################################

PYTHON_FROZENLIST_VERSION = 1.7.0
PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/79/b1/b64018016eeb087db503b038296fd782586432b9c077fc5c7839e9cb6ef6
PYTHON_FROZENLIST_SETUP_TYPE = pep517
PYTHON_FROZENLIST_LICENSE = Apache-2.0
PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
PYTHON_FROZENLIST_DEPENDENCIES = \
	host-python-expandvars \
	host-python-setuptools
# C code generation required Cython 3 which we don't have in Buildroot yet.
PYTHON_FROZENLIST_BUILD_OPTS = -C=pure-python=true

$(eval $(python-package))
