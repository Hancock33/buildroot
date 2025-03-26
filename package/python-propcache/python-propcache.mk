################################################################################
#
# python-propcache
#
################################################################################

PYTHON_PROPCACHE_VERSION = 0.3.1
PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/07/c8/fdc6686a986feae3541ea23dcaa661bd93972d3940460646c6bb96e21c40
PYTHON_PROPCACHE_SETUP_TYPE = setuptools
PYTHON_PROPCACHE_LICENSE = Apache-2.0
PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
PYTHON_PROPCACHE_DEPENDENCIES = \
	host-python-cython \
	host-python-expandvars

$(eval $(python-package))
