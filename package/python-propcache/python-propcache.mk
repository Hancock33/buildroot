################################################################################
#
# python-propcache
#
################################################################################

PYTHON_PROPCACHE_VERSION = 0.5.2
PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/ec/44/c87281c333769159c50594f22610f77398a47ccbfbbf23074e744e86f87c
PYTHON_PROPCACHE_SETUP_TYPE = setuptools
PYTHON_PROPCACHE_LICENSE = Apache-2.0
PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
PYTHON_PROPCACHE_DEPENDENCIES = \
	host-python-cython \
	host-python-expandvars

$(eval $(python-package))
