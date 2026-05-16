################################################################################
#
# python-aiodns
#
################################################################################

PYTHON_AIODNS_VERSION = 4.0.3
PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/7f/70/2047b454e8210a19876c263b801a4a1b3649f48af044bd076be468a8bd65
PYTHON_AIODNS_SETUP_TYPE = setuptools
PYTHON_AIODNS_LICENSE = MIT
PYTHON_AIODNS_LICENSE_FILES = LICENSE

$(eval $(python-package))
