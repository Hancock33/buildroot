################################################################################
#
# mesa3d
#
################################################################################
# git describe --abbrev=40 origin/staging/24.0 | cut -d '-' -f 2-
MESA3D_VERSION = mesa-24.1.0-rc2
MESA3D_SITE = $(call gitlabfreedesktop,mesa,mesa,$(MESA3D_VERSION))
MESA3D_LICENSE = MIT, SGI, Khronos
MESA3D_LICENSE_FILES = docs/license.rst
MESA3D_CPE_ID_VENDOR = mesa3d
MESA3D_CPE_ID_PRODUCT = mesa

MESA3D_INSTALL_STAGING = YES

MESA3D_PROVIDES =

MESA3D_DEPENDENCIES = \
	host-bison \
	host-flex \
	host-python-mako \
	host-python-ply \
	expat \
	libdrm \
	zlib \
	zstd

# batocera
ifeq ($(BR2_PACKAGE_DIRECTX_HEADERS),y)
MESA3D_DEPENDENCIES += directx-headers
endif

MESA3D_CONF_OPTS = \
	-Dgallium-omx=disabled \
	-Dpower8=disabled

ifeq ($(BR2_PACKAGE_MESA3D_DRI3),y)
MESA3D_CONF_OPTS += -Ddri3=enabled
ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE),y)
MESA3D_DEPENDENCIES += xlib_libxshmfence
endif
else
MESA3D_CONF_OPTS += -Ddri3=disabled
endif

# batocera - adjust the llvm dependencies
ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
MESA3D_DEPENDENCIES += host-llvm llvm
MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
MESA3D_CONF_OPTS += -Dllvm=enabled
ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
MESA3D_CONF_OPTS += -Dcpp_rtti=true
else
MESA3D_CONF_OPTS += -Dcpp_rtti=false
endif
else
# Avoid automatic search of llvm-config
MESA3D_CONF_OPTS += -Dllvm=disabled
endif

# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
# libMesaOpenCL and CL headers are installed
ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
	MESA3D_PROVIDES += libopencl
	MESA3D_DEPENDENCIES += clang libclc spirv-llvm-translator
	MESA3D_CONF_OPTS += -Dgallium-opencl=standalone
	MESA3D_CONF_OPTS += -Dmicrosoft-clc=disabled
	MESA3D_CONF_OPTS += -Dintel-clc=system
else
	MESA3D_CONF_OPTS += -Dgallium-opencl=disabled
endif

ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
MESA3D_DEPENDENCIES += elfutils
endif

ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
# Disable-mangling not yet supported by meson build system.
# glx:
#  dri          : dri based GLX requires at least one DRI driver || dri based GLX requires shared-glapi
#  xlib         : xlib conflicts with any dri driver
# Always enable glx-direct; without it, many GLX applications don't work.
MESA3D_CONF_OPTS += \
	-Dglx=dri \
	-Dglx-direct=true
ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),y)
MESA3D_CONF_OPTS += -Dgallium-xa=enabled
else
MESA3D_CONF_OPTS += -Dgallium-xa=disabled
endif
else
MESA3D_CONF_OPTS += \
	-Dglx=disabled \
	-Dgallium-xa=disabled
endif

ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
MESA3D_CONF_OPTS += -Dgallium-vc4-neon=auto
else
MESA3D_CONF_OPTS += -Dgallium-vc4-neon=disabled
endif

# Drivers

# Intel Gallium Drivers
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS)   += crocus
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_I915)     += i915
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS)     += iris
# Gallium Drivers
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO) += freedreno
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_TEGRA)    += tegra
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D)      += v3d
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4)      += vc4
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VIRGL)    += virgl
# batocera - add zink
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ZINK)     += zink
# batocera - add d3d12
MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_D3D12)    += d3d12
# batocera - Vulkan Drivers
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_ALL)       += all
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_AMD)       += amd
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_BROADCOM)  += broadcom
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_FREEDRENO) += freedreno
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_HASWELL)   += intel_hasvk
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)     += intel
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_LAVAPIPE)  += lavapipe
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_NOUVEAU)   += nouveau
MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_PANFROST)  += panfrost
# batocera - codecs
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_VC1DEC)        += vc1dec
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264DEC)       += h264dec
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H264ENC)       += h264enc
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265DEC)       += h265dec
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_H265ENC)       += h265enc
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_AV1DEC)        += av1dec
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_AV1ENC)        += av1enc
MESA3D_VIDEO_CODECS-$(BR2_PACKAGE_MESA3D_VIDEO_CODEC_VP9DEC)        += vp9dec

# batocera
# Vulkan Layers - helps with multi-GPU switching
ifeq ($(BR2_PACKAGE_WAYLAND)$(BR2_PACKAGE_MESA3D_NEEDS_X11),yy)
MESA3D_DEPENDENCIES += python3 host-glslang
MESA3D_CONF_OPTS += -Dvulkan-layers=device-select,overlay
endif

ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
MESA3D_CONF_OPTS += \
	-Dgallium-drivers= \
	-Dgallium-extra-hud=false
else
MESA3D_CONF_OPTS += \
	-Dshared-glapi=enabled \
	-Dgallium-drivers=$(subst $(space),$(comma),$(MESA3D_GALLIUM_DRIVERS-y)) \
	-Dgallium-extra-hud=true
endif

ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
MESA3D_CONF_OPTS += \
	-Dvulkan-drivers=
else
MESA3D_DEPENDENCIES += host-python-glslang
MESA3D_CONF_OPTS += \
	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
endif

# batocera - video codecs
ifeq ($(BR2_PACKAGE_MESA3D_VIDEO_CODEC),)
MESA3D_CONF_OPTS += \
	-Dvideo-codecs=
else
MESA3D_CONF_OPTS += \
	-Dvideo-codecs=$(subst $(space),$(comma),$(MESA3D_VIDEO_CODECS-y))
endif

# APIs

ifeq ($(BR2_PACKAGE_MESA3D_OSMESA_GALLIUM),y)
MESA3D_CONF_OPTS += -Dosmesa=true
else
MESA3D_CONF_OPTS += -Dosmesa=false
endif

# Always enable OpenGL:
#   - Building OpenGL ES without OpenGL is not supported, so always keep opengl enabled.
MESA3D_CONF_OPTS += -Dopengl=true

# libva and mesa3d have a circular dependency
# we do not need libva support in mesa3d, therefore disable this option
# batocera - we enable vaapi acceleration
ifneq ($(BR2_PACKAGE_BATOCERA_TARGET_WSL),y)
ifeq ($(BR2_PACKAGE_LIBVA),y)
MESA3D_CONF_OPTS += -Dgallium-va=enabled
MESA3D_DEPENDENCIES += libva
# batocera - we link vaapi acceleration drivers accordingly
define MESA3D_ADD_VA_LINKS
	(mkdir -p $(TARGET_DIR)/usr/lib/va && cd $(TARGET_DIR)/usr/lib/va \
	    && ln -sf /usr/lib/dri/radeonsi_drv_video.so radeonsi_drv_video.so \
		&& ln -sf /usr/lib/dri/r600_drv_video.so r600_drv_video.so \
		&& ln -sf /usr/lib/dri/nouveau_drv_video.so nouveau_drv_video.so)
endef

MESA3D_POST_INSTALL_TARGET_HOOKS += MESA3D_ADD_VA_LINKS
else
MESA3D_CONF_OPTS += -Dgallium-va=disabled
endif
else
MESA3D_CONF_OPTS += -Dgallium-va=disabled
endif

# libGL is only provided for a full xorg stack, without libglvnd
ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgl)
else
define MESA3D_REMOVE_OPENGL_HEADERS
	rm -rf $(STAGING_DIR)/usr/include/GL/
endef

MESA3D_POST_INSTALL_STAGING_HOOKS += MESA3D_REMOVE_OPENGL_HEADERS
endif

ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_X11),y)
MESA3D_DEPENDENCIES += \
	xlib_libX11 \
	xlib_libXext \
	xlib_libXdamage \
	xlib_libXfixes \
	xlib_libXrandr \
	xlib_libXxf86vm \
	xorgproto \
	libxcb
MESA3D_PLATFORMS += x11
endif
ifeq ($(BR2_PACKAGE_WAYLAND),y)
MESA3D_DEPENDENCIES += wayland wayland-protocols
MESA3D_PLATFORMS += wayland
endif

MESA3D_CONF_OPTS += \
	-Dplatforms=$(subst $(space),$(comma),$(MESA3D_PLATFORMS))

ifeq ($(BR2_PACKAGE_MESA3D_GBM),y)
MESA3D_CONF_OPTS += \
	-Dgbm=enabled
else
MESA3D_CONF_OPTS += \
	-Dgbm=disabled
endif

ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libegl)
MESA3D_CONF_OPTS += \
	-Degl=enabled
else
MESA3D_CONF_OPTS += \
	-Degl=disabled
endif

ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES),y)
MESA3D_PROVIDES += $(if $(BR2_PACKAGE_LIBGLVND),,libgles)
MESA3D_CONF_OPTS += -Dgles1=enabled -Dgles2=enabled
else
MESA3D_CONF_OPTS += -Dgles1=disabled -Dgles2=disabled
endif

ifeq ($(BR2_PACKAGE_VALGRIND),y)
MESA3D_CONF_OPTS += -Dvalgrind=enabled
MESA3D_DEPENDENCIES += valgrind
else
MESA3D_CONF_OPTS += -Dvalgrind=disabled
endif

ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
MESA3D_CONF_OPTS += -Dlibunwind=enabled
MESA3D_DEPENDENCIES += libunwind
else
MESA3D_CONF_OPTS += -Dlibunwind=disabled
endif

ifeq ($(BR2_PACKAGE_MESA3D_VDPAU),y)
MESA3D_DEPENDENCIES += libvdpau
MESA3D_CONF_OPTS += -Dgallium-vdpau=enabled
else
MESA3D_CONF_OPTS += -Dgallium-vdpau=disabled
endif

ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
MESA3D_CONF_OPTS += -Dlmsensors=enabled
MESA3D_DEPENDENCIES += lm-sensors
else
MESA3D_CONF_OPTS += -Dlmsensors=disabled
endif

ifeq ($(BR2_PACKAGE_ZSTD),y)
MESA3D_CONF_OPTS += -Dzstd=enabled
MESA3D_DEPENDENCIES += zstd
else
MESA3D_CONF_OPTS += -Dzstd=disabled
endif

# batocera icd.@0@.json vulkan files
define MESA3D_VULKANJSON_X86_64
        $(SED) s+"host_machine.cpu()"+"'x86_64'"+ $(@D)/src/intel/vulkan/meson.build \
		    $(@D)/src/intel/vulkan_hasvk/meson.build $(@D)/src/amd/vulkan/meson.build
endef

define MESA3D_VULKANJSON_X86
        $(SED) s+"host_machine.cpu()"+"'i686'"+ $(@D)/src/intel/vulkan/meson.build \
		    $(@D)/src/intel/vulkan_hasvk/meson.build $(@D)/src/amd/vulkan/meson.build
endef

ifeq ($(BR2_x86_64),y)
    MESA3D_PRE_CONFIGURE_HOOKS += MESA3D_VULKANJSON_X86_64
endif
ifeq ($(BR2_x86_i686),y)
    MESA3D_PRE_CONFIGURE_HOOKS += MESA3D_VULKANJSON_X86
endif
# end batocera

MESA3D_CFLAGS = -O2 "$(BR2_TARGET_OPTIMIZATION)"
MESA3D_CXXFLAGS = -O2 "$(BR2_TARGET_OPTIMIZATION)"

# m68k needs 32-bit offsets in switch tables to build
ifeq ($(BR2_m68k),y)
MESA3D_CFLAGS += -mlong-jump-table-offsets
endif

ifeq ($(BR2_PACKAGE_LIBGLVND),y)
ifneq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX)$(BR2_PACKAGE_MESA3D_OPENGL_EGL),)
MESA3D_DEPENDENCIES += libglvnd
MESA3D_CONF_OPTS += -Dglvnd=enabled
else
MESA3D_CONF_OPTS += -Dglvnd=disabled
endif
else
MESA3D_CONF_OPTS += -Dglvnd=disabled
endif

ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
	HOST_MESA3D_DEPENDENCIES += host-python-mako \
	host-python-ply \
	host-libclc \
	host-spirv-headers \
	host-spirv-tools \
	host-spirv-llvm-translator
	MESA3D_DEPENDENCIES += host-mesa3d
endif

HOST_MESA3D_CONF_OPTS += -Dllvm=enabled
HOST_MESA3D_CONF_OPTS += -Dshared-llvm=enabled
HOST_MESA3D_CONF_OPTS += -Dintel-clc=enabled
HOST_MESA3D_CONF_OPTS += -Dgallium-drivers=''
HOST_MESA3D_CONF_OPTS += -Dvulkan-drivers=''
HOST_MESA3D_CONF_OPTS += -Dplatforms=''
HOST_MESA3D_CONF_OPTS += -Dglx=disabled
HOST_MESA3D_CONF_OPTS += -Dlibunwind=disabled
HOST_MESA3D_CONF_OPTS += -Dzstd=disabled

define HOST_MESA3D_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/src/intel/compiler/intel_clc $(HOST_DIR)/bin/intel_clc
endef

$(eval $(meson-package))
$(eval $(host-meson-package))
