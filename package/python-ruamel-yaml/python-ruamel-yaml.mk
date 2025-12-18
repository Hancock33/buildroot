################################################################################
#
# python-ruamel-yaml
#
################################################################################

PYTHON_RUAMEL_YAML_VERSION = 0.18.17
PYTHON_RUAMEL_YAML_SOURCE = ruamel_yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/3a/2b/7a1f1ebcd6b3f14febdc003e658778d81e76b40df2267904ee6b13f0c5c6
PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
PYTHON_RUAMEL_YAML_LICENSE = MIT
PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
PYTHON_RUAMEL_YAML_CPE_ID_VENDOR = ruamel.yaml_project
PYTHON_RUAMEL_YAML_CPE_ID_PRODUCT = ruamel.yaml

$(eval $(python-package))
