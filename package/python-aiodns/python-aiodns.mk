################################################################################
#
# python-aiodns
#
################################################################################

PYTHON_AIODNS_VERSION = 3.3.0
PYTHON_AIODNS_SOURCE = aiodns-$(PYTHON_AIODNS_VERSION).tar.gz
PYTHON_AIODNS_SITE = https://files.pythonhosted.org/packages/f6/30/2c10dc401091beffef6f516da38f7e6391d2a77afe5e092956855e1d07a7
PYTHON_AIODNS_SETUP_TYPE = setuptools
PYTHON_AIODNS_LICENSE = MIT
PYTHON_AIODNS_LICENSE_FILES = LICENSE

$(eval $(python-package))
