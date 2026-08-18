################################################################################
#
# python-idna
#
################################################################################

PYTHON_IDNA_VERSION = 3.19
PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/5f/f7/abb373e5757eaec4b922b92f97ec8d6d7e057cf06778247604fbc4e7c3f3
PYTHON_IDNA_LICENSE = BSD-3-Clause
PYTHON_IDNA_LICENSE_FILES = LICENSE.md
PYTHON_IDNA_SETUP_TYPE = flit

$(eval $(python-package))
$(eval $(host-python-package))
