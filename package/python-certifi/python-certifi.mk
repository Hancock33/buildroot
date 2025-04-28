################################################################################
#
# python-certifi
#
################################################################################

PYTHON_CERTIFI_VERSION = 2025.4.26
PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/e8/9e/c05b3920a3b7d20d3d3310465f50348e5b3694f4f88c6daf736eef3024c4
PYTHON_CERTIFI_SETUP_TYPE = setuptools
PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
PYTHON_CERTIFI_LICENSE_FILES = LICENSE

$(eval $(python-package))
$(eval $(host-python-package))
