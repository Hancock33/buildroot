################################################################################
#
# python-glslang
#
################################################################################

PYTHON_GLSLANG_VERSION = 14.3.0
PYTHON_GLSLANG_SITE = $(call github,KhronosGroup,glslang,$(PYTHON_GLSLANG_VERSION))
PYTHON_GLSLANG_LICENSE = BSD-3-Clause
PYTHON_GLSLANG_LICENSE_FILES = LICENSE.txt
PYTHON_GLSLANG_DEPENDENCIES = host-python3

HOST_PYTHON_GLSLANG_CONF_OPTS += -DENABLE_OPT=OFF

$(eval $(host-cmake-package))
