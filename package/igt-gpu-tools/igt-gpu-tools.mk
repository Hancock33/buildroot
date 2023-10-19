################################################################################
#
# igt-gpu-tools
#
################################################################################

IGT_GPU_TOOLS_VERSION = 1.28
IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-v$(IGT_GPU_TOOLS_VERSION).tar.bz2
IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/v$(IGT_GPU_TOOLS_VERSION)
IGT_GPU_TOOLS_LICENSE = MIT
IGT_GPU_TOOLS_LICENSE_FILES = COPYING
IGT_GPU_TOOLS_INSTALL_STAGING = YES
IGT_GPU_TOOLS_DEPENDENCIES = host-pkgconf cairo elfutils kmod libdrm libglib2 libpciaccess pixman procps-ng zlib

ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
IGT_GPU_TOOLS_DEPENDENCIES += libunwind
IGT_GPU_TOOLS_CONF_OPTS += -Dlibunwind=enabled
else
IGT_GPU_TOOLS_CONF_OPTS += -Dlibunwind=disabled
endif

$(eval $(meson-package))
