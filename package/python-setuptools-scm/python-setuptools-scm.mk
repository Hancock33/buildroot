################################################################################
#
# python-setuptools-scm
#
################################################################################

PYTHON_SETUPTOOLS_SCM_VERSION = 8.3.0
PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/ae/c1/0eb89ad8a0aa7033bbd0cc9fb44a0090c20edaba495f291e31be010e6ec1
PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517

HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
	host-python-packaging \
	host-python-setuptools \
	host-python-typing-extensions

$(eval $(host-python-package))
