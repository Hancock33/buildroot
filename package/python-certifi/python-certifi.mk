################################################################################
#
# python-certifi
#
################################################################################

PYTHON_CERTIFI_VERSION = 2025.7.9
PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/de/8a/c729b6b60c66a38f590c4e774decc4b2ec7b0576be8f1aa984a53ffa812a
PYTHON_CERTIFI_SETUP_TYPE = setuptools
PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
PYTHON_CERTIFI_LICENSE_FILES = LICENSE

$(eval $(python-package))
$(eval $(host-python-package))
