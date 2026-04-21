################################################################################
#
# python-idna
#
################################################################################

PYTHON_IDNA_VERSION = 3.12
PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/22/12/2948fbe5513d062169bd91f7d7b1cd97bc8894f32946b71fa39f6e63ca0c
PYTHON_IDNA_LICENSE = BSD-3-Clause
PYTHON_IDNA_LICENSE_FILES = LICENSE.md
PYTHON_IDNA_SETUP_TYPE = flit

$(eval $(python-package))
$(eval $(host-python-package))
