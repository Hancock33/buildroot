################################################################################
#
# zstd
#
################################################################################

ZSTD_VERSION = 1.5.6
ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
ZSTD_INSTALL_STAGING = YES
ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
ZSTD_LICENSE_FILES = LICENSE COPYING
ZSTD_CPE_ID_VENDOR = facebook
ZSTD_CPE_ID_PRODUCT = zstandard
ZSTD_SUBDIR = build/cmake

ifeq ($(BR2_PACKAGE_ZLIB),y)
ZSTD_DEPENDENCIES += zlib
ZSTD_CONF_OPTS += -DZSTD_ZLIB_SUPPORT=ON
endif

ifeq ($(BR2_PACKAGE_XZ),y)
ZSTD_DEPENDENCIES += xz
ZSTD_CONF_OPTS += -DZSTD_LZMA_SUPPORT=ON
endif

ifeq ($(BR2_PACKAGE_LZ4),y)
ZSTD_DEPENDENCIES += lz4
ZSTD_CONF_OPTS += -DZSTD_LZ4_SUPPORT=ON
endif

ifeq ($(BR2_STATIC_LIBS),n)
ZSTD_CONF_OPTS += -DZSTD_BUILD_STATIC=OFF
endif

ifeq ($(BR2_SHARED_LIBS),y)
ZSTD_CONF_OPTS += -DZSTD_PROGRAMS_LINK_SHARED=ON
endif

HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)

# We are a ccache dependency, so we can't use ccache
HOST_ZSTD_ENV += CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"

define HOST_ZSTD_BUILD_CMDS
	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
		-C $(@D) zstd-release lib-release
endef

define HOST_ZSTD_INSTALL_CMDS
	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
		-C $(@D) install
endef

$(eval $(cmake-package))
$(eval $(host-generic-package))
