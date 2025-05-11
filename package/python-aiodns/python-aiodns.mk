################################################################################
#
# python-aiodns
#
################################################################################

PYTHON_AIODNS_VERSION = 3.4.0
PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/92/9b/e96226eed7568ddfd075b03695e3e1298d9de48724128a3a2957f5ee6ec8
PYTHON_AIODNS_SETUP_TYPE = setuptools
PYTHON_AIODNS_LICENSE = MIT
PYTHON_AIODNS_LICENSE_FILES = LICENSE

$(eval $(python-package))
