################################################################################
#
# python-numpy
#
################################################################################

PYTHON_NUMPY_VERSION = 1.26.4
PYTHON_NUMPY_SOURCE = numpy-$(PYTHON_NUMPY_VERSION).tar.gz
PYTHON_NUMPY_SITE = https://files.pythonhosted.org/packages/65/6e/09db70a523a96d25e115e71cc56a6f9031e7b8cd166c1ac8438307c14058
PYTHON_NUMPY_LICENSE = BSD-3-Clause, MIT, Zlib
PYTHON_NUMPY_LICENSE_FILES = \
	LICENSE.txt \
	numpy/core/src/multiarray/dragon4.c \
	numpy/core/include/numpy/libdivide/LICENSE.txt \
	numpy/linalg/lapack_lite/LICENSE.txt \
	tools/npy_tempita/license.txt
PYTHON_NUMPY_CPE_ID_VENDOR = numpy
PYTHON_NUMPY_CPE_ID_PRODUCT = numpy
PYTHON_NUMPY_SETUP_TYPE = setuptools

PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython

PYTHON_NUMPY_CONF_ENV += \
	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"

PYTHON_NUMPY_NINJA_ENV += \
	PYTHONPATH="$(@D)/vendored-meson/meson:$(PYTHON3_PATH)"

ifeq ($(BR2_PACKAGE_LAPACK),y)
PYTHON_NUMPY_DEPENDENCIES += lapack
PYTHON_NUMPY_CONF_OPTS += -Dlapack=lapack
else
PYTHON_NUMPY_CONF_OPTS += -Dlapack=""
endif

ifeq ($(BR2_PACKAGE_OPENBLAS),y)
PYTHON_NUMPY_DEPENDENCIES += openblas
PYTHON_NUMPY_CONF_OPTS += -Dblas=openblas
else
PYTHON_NUMPY_CONF_OPTS += -Dblas=""
endif

ifeq ($(BR2_arcle),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
else ifeq ($(BR2_arceb),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
else ifeq ($(BR2_aarch64),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
else ifeq ($(BR2_arm),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
else ifeq ($(BR2_armeb),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = MOTOROLA_EXTENDED_12_BYTES_BE
else ifeq ($(BR2_i386),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
else ifeq ($(BR2_mips),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_BE
else ifeq ($(BR2_mipsel),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = INTEL_EXTENDED_12_BYTES_LE
else ifeq ($(BR2_powerpc),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
else ifeq ($(BR2_powerpc64),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_BE
else ifeq ($(BR2_sh),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_DOUBLE_LE
else ifeq ($(BR2_x86_64),y)
PYTHON_NUMPY_LONGDOUBLE_FORMAT = IEEE_QUAD_LE
endif

PYTHON_NUMPY_MESON_EXTRA_PROPERTIES = \
	longdouble_format='$(PYTHON_NUMPY_LONGDOUBLE_FORMAT)'

HOST_PYTHON_NUMPY_CONF_ENV += \
	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"

HOST_PYTHON_NUMPY_NINJA_ENV += \
	PYTHONPATH="$(@D)/vendored-meson/meson:$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"

# Rather than add a host-blas or host-lapack dependencies, just use unoptimized,
# in-tree code.
HOST_PYTHON_NUMPY_CONF_OPTS = -Dblas="" -Dlapack=""

# Fixup the npymath.ini prefix path with actual target staging area where
# numpy core was built. Without this, target builds using numpy distutils
# extensions like python-scipy, python-numba cannot find -lnpymath since
# it uses host libraries (like libnpymath.a).
# So, the numpy distutils extension packages would explicitly link this
# config path for their package environment.
define PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES
	$(SED) '/^pkgdir=/d;/^prefix=/i pkgdir=$(PYTHON3_PATH)/site-packages/numpy/core' \
		$(PYTHON3_PATH)/site-packages/numpy/core/lib/npy-pkg-config/npymath.ini
endef
PYTHON_NUMPY_POST_INSTALL_STAGING_HOOKS += PYTHON_NUMPY_FIXUP_NPY_PKG_CONFIG_FILES

# Some package may include few headers from NumPy, so let's install it
# in the staging area.
PYTHON_NUMPY_INSTALL_STAGING = YES

$(eval $(meson-package))
$(eval $(host-meson-package))
