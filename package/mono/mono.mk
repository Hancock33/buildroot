################################################################################
#
# mono
#
################################################################################

MONO_VERSION = mono-6.12.0.206
MONO_SOURCE = $(MONO_VERSION).tar.gz
MONO_SITE = https://github.com/mono/mono.git
MONO_SITE_METHOD=git
MONO_GIT_SUBMODULES=YES
MONO_SELINUX_MODULES = mono
MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
MONO_LICENSE_FILES = LICENSE mcs/COPYING \
	external/Newtonsoft.Json/Tools/7-zip/copying.txt
MONO_CPE_ID_VENDOR = mono-project
MONO_INSTALL_STAGING = YES

## Mono native

MONO_COMMON_CONF_OPTS = --with-mcs-docs=no \
	--with-ikvm-native=no \
	--enable-minimal=profiler,debug \
	--enable-static \
	--disable-btls \
	--disable-system-aot \
	--enable-ninja

# Disable managed code (mcs folder) from building
MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-mcs-build

# The libraries have been built by the host-mono build. Since they are
# architecture-independent, we simply copy them to the target.
define MONO_INSTALL_LIBS
	rsync -av --exclude=*.so --exclude=*.mdb \
		$(HOST_DIR)/lib/mono $(TARGET_DIR)/usr/lib/
endef

MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS

ifeq ($(BR2_PACKAGE_LIBICONV),y)
MONO_DEPENDENCIES += libiconv
endif

MONO_DEPENDENCIES += \
	host-mono \
	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
	libatomic_ops

## Mono managed

HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries

# ensure monolite is used
HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false

HOST_MONO_DEPENDENCIES = host-monolite host-gettext host-python3

define HOST_MONO_SETUP_MONOLITE
	mkdir $(@D)/mcs/class/lib
	rm -rf $(@D)/mcs/class/lib/monolite
	(cd $(@D)/mcs/class/lib; ln -sf $(HOST_DIR)/lib/monolite monolite)
endef

HOST_MONO_POST_CONFIGURE_HOOKS += HOST_MONO_SETUP_MONOLITE

define MONO_AUTOGEN
	cd $(@D); NOCONFIGURE=1 ./autogen.sh
endef

MONO_PRE_CONFIGURE_HOOKS += MONO_AUTOGEN
HOST_MONO_PRE_CONFIGURE_HOOKS += MONO_AUTOGEN

$(eval $(autotools-package))
$(eval $(host-autotools-package))
