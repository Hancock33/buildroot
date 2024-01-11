################################################################################
#
# python-bcrypt
#
################################################################################

PYTHON_BCRYPT_VERSION = 4.1.2
PYTHON_BCRYPT_SOURCE = bcrypt-$(PYTHON_BCRYPT_VERSION).tar.gz
PYTHON_BCRYPT_SITE = https://files.pythonhosted.org/packages/72/07/6a6f2047a9dc9d012b7b977e4041d37d078b76b44b7ee4daf331c1e6fb35
PYTHON_BCRYPT_SETUP_TYPE = setuptools-rust
PYTHON_BCRYPT_LICENSE = Apache-2.0
PYTHON_BCRYPT_LICENSE_FILES = LICENSE
PYTHON_BCRYPT_CARGO_MANIFEST_PATH = src/_bcrypt/Cargo.toml

$(eval $(python-package))
