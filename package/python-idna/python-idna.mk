################################################################################
#
# python-idna
#
################################################################################

PYTHON_IDNA_VERSION = 3.17
PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/b9/28/99c51f664567218d824af024c0251650fb27e4ca066df188dab0769c5b91
PYTHON_IDNA_LICENSE = BSD-3-Clause
PYTHON_IDNA_LICENSE_FILES = LICENSE.md
PYTHON_IDNA_SETUP_TYPE = flit

$(eval $(python-package))
$(eval $(host-python-package))
