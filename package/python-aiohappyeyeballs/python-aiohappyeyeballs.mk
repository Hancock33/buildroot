################################################################################
#
# python-aiohappyeyeballs
#
################################################################################

PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.2
PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/c7/d9/e710a5c9e51b4d5a977c823ce323a81d344da8c1b6fba16bb270a8be800d
PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = pep517
PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
PYTHON_AIOHAPPYEYEBALLS_DEPENDENCIES = host-python-poetry-core

$(eval $(python-package))
