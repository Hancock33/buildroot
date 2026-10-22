################################################################################
#
# libplacebo
#
################################################################################

LIBPLACEBO_VERSION = v7.360.1
LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
LIBPLACEBO_SITE_METHOD = git
LIBPLACEBO_GIT_SUBMODULES = YES
LIBPLACEBO_LICENSE = LGPL-2.1+
LIBPLACEBO_LICENSE_FILES = LICENSE
LIBPLACEBO_INSTALL_STAGING = YES

ifeq ($(BR2_PACKAGE_LCMS2),y)
LIBPLACEBO_DEPENDENCIES += lcms2
LIBPLACEBO_CONF_OPTS += -Dlcms=enabled
else
LIBPLACEBO_CONF_OPTS += -Dlcms=disabled
endif

ifeq ($(BR2_PACKAGE_XXHASH),y)
LIBPLACEBO_DEPENDENCIES += xxhash
LIBPLACEBO_CONF_OPTS += -Dxxhash=enabled
else
LIBPLACEBO_CONF_OPTS += -Dxxhash=disabled
endif

# batcoera - add the options below...
LIBPLACEBO_CONF_OPTS = -Ddemos=false

# batocera - ass dolby vision reshaping support
ifeq ($(BR2_PACKAGE_LIBDOVI),y)
LIBPLACEBO_CONF_OPTS += -Ddovi=enabled
LIBPLACEBO_CONF_OPTS += -Dlibdovi=enabled
LIBPLACEBO_DEPENDENCIES += libdovi
else
LIBPLACEBO_CONF_OPTS += -Ddovi=disabled
LIBPLACEBO_CONF_OPTS += -Dlibdovi=disabled
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
LIBPLACEBO_CONF_OPTS += -Dvulkan=enabled
LIBPLACEBO_DEPENDENCIES += vulkan-headers vulkan-loader
else
LIBPLACEBO_CONF_OPTS += -Dvulkan=disabled
endif

ifeq ($(BR2_PACKAGE_GLSLANG),y)
LIBPLACEBO_CONF_OPTS += -Dglslang=enabled
LIBPLACEBO_DEPENDENCIES += glslang
LIBPLACEBO_LDFLAGS = -lglslang
else
LIBPLACEBO_CONF_OPTS += -Dglslang=disabled
endif

ifeq ($(BR2_PACKAGE_SHADERC),y)
LIBPLACEBO_CONF_OPTS += -Dshaderc=enabled
LIBPLACEBO_DEPENDENCIES += shaderc
else
LIBPLACEBO_CONF_OPTS += -Dshaderc=disabled

$(eval $(meson-package))
