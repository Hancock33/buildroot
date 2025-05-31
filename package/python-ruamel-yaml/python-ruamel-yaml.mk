################################################################################
#
# python-ruamel-yaml
#
################################################################################

PYTHON_RUAMEL_YAML_VERSION = 0.18.12
PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/56/2f/5a4dd48a259cb72d6f972abb728d3b219b50980fe3b7c548e0be7c5f56aa
PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
PYTHON_RUAMEL_YAML_LICENSE = MIT
PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
PYTHON_RUAMEL_YAML_CPE_ID_VENDOR = ruamel.yaml_project
PYTHON_RUAMEL_YAML_CPE_ID_PRODUCT = ruamel.yaml

$(eval $(python-package))
