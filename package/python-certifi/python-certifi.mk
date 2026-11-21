################################################################################
#
# python-certifi
#
################################################################################

PYTHON_CERTIFI_VERSION = 2026.11.20
PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/51/33/4cd27639502f010084bcef7a2036391dd637439901341ce1a530f36f6e51
PYTHON_CERTIFI_SETUP_TYPE = setuptools
PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
PYTHON_CERTIFI_LICENSE_FILES = LICENSE

$(eval $(python-package))
$(eval $(host-python-package))
