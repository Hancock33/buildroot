################################################################################
#
# mold
#
################################################################################
# Version: Commits on Oct 05, 2026
MOLD_VERSION = v3.0.0
MOLD_SITE = $(call github,rui314,mold,$(MOLD_VERSION))
MOLD_LICENSE = MIT
HOST_MOLD_DEPENDENCIES += host-flex host-bison host-zstd host-cmake host-tbb host-xxhash host-blake3 host-rustc

HOST_MOLD_CARGO_ENV = RUSTFLAGS="-C link-args=-L$(HOST_DIR)/lib -C link-args=-Wl,-rpath,$(HOST_DIR)/lib"

# 'cargo install' below does the compile, nothing to do here.
define HOST_MOLD_BUILD_CMDS
	@true
endef

define HOST_MOLD_INSTALL_CMDS
	cd $(@D) && \
	$(HOST_MAKE_ENV) \
		$(HOST_CONFIGURE_OPTS) \
		$(HOST_PKG_CARGO_ENV) \
		$(HOST_MOLD_CARGO_ENV) \
		cargo install \
			--offline \
			--root $(HOST_DIR) \
			--bins \
			--no-track \
			--force \
			--locked \
			--path cli
endef

define HOST_MOLD_INSTALL_LINKS
	mkdir -p $(HOST_DIR)/$(GNU_TARGET_NAME)/bin $(HOST_DIR)/libexec/mold
	ln -sf ../../bin/mold $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.mold
	ln -sf mold $(HOST_DIR)/bin/ld.mold
	ln -sf mold $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
	ln -sf mold $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
	ln -sf ../../bin/mold $(HOST_DIR)/libexec/mold/ld
endef
 
HOST_MOLD_POST_INSTALL_HOOKS += HOST_MOLD_INSTALL_LINKS

$(eval $(host-cargo-package))
