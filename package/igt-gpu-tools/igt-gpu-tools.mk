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

ifeq ($(BR2_PACKAGE_JSON_C),y)
IGT_GPU_TOOLS_CONF_OPTS += -Drunner=enabled
IGT_GPU_TOOLS_DEPENDENCIES += json-c
else
IGT_GPU_TOOLS_CONF_OPTS += -Drunner=disabled
endif

ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
IGT_GPU_TOOLS_CONF_OPTS += -Dlibunwind=enabled
IGT_GPU_TOOLS_DEPENDENCIES += libunwind
else
IGT_GPU_TOOLS_CONF_OPTS += -Dlibunwind=disabled
endif

# igt_stats is broken with Relocation link-time protections enabled
# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/102
ifeq ($(BR2_RELRO_NONE),)
define IGT_GPU_TOOLS_REMOVE_IGT_STATS
	$(RM) -fr $(TARGET_DIR)/usr/bin/igt_stats
endef
IGT_GPU_TOOLS_POST_INSTALL_TARGET_HOOKS += IGT_GPU_TOOLS_REMOVE_IGT_STATS
endif

$(eval $(meson-package))
