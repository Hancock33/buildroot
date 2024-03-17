################################################################################
#
# igt-gpu-tools
#
################################################################################

IGT_GPU_TOOLS_VERSION = e590379e8875cfefdd41e33acf3d1533044d2bcd
IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.bz2
IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/$(IGT_GPU_TOOLS_VERSION)
IGT_GPU_TOOLS_LICENSE = MIT
IGT_GPU_TOOLS_LICENSE_FILES = COPYING
IGT_GPU_TOOLS_INSTALL_STAGING = YES
IGT_GPU_TOOLS_DEPENDENCIES = \
	host-pkgconf \
	cairo \
	elfutils \
	kmod \
	libdrm \
	libglib2 \
	libpciaccess \
	pixman \
	procps-ng \
	udev \
	zlib

# On x86 systems, libigt resolves igt_half_to_float and igt_float_to_half as
# indirect functions at runtime by checking CPU features with igt_x86_features.
# The igt_x86_features function is implemented is a different object and the
# call uses the PLT itself. If lazy binding is disabled, this causes a segfault
# while resolving the symbols for libigt on x64 systems. Disable BINDNOW on X86
# systems to prevent the segfaults.
# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/102
# https://bugs.gentoo.org/788625#c13
ifeq ($(BR2_i386)$(BR2_x86_64)x$(BR2_RELRO_NONE),yx)
IGT_GPU_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) -Wl,-z,lazy
endif

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

$(eval $(meson-package))
