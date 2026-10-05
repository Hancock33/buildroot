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

HOST_MOLD_BIN_DIR = target/$(RUSTC_TARGET_NAME)/$(MOLD_CARGO_MODE)

HOST_MOLD_CARGO_OPTS = \
	--release \
	--target=$(RUSTC_TARGET_NAME) \
	--manifest-path=$(@D)/Cargo.toml

define HOST_MOLD_BUILD_CMDS
	RUSTFLAGS="-C link-args=-L$(HOST_DIR)/lib -C link-args=-Wl,-rpath,$(HOST_DIR)/lib" \
	$(HOST_MAKE_ENV) cargo build $(HOST_MOLD_CARGO_OPTS)
endef

define MOLD_INSTALL
    # cleanup any existing versions
    rm -rf $(HOST_DIR)/bin/mold
    rm -rf $(HOST_DIR)/lib/mold $(HOST_DIR)/libexec/mold
    # create directories
    mkdir -p $(HOST_DIR)/{lib/mold,libexec/mold}
    # install new version
    $(INSTALL) -D -m 0755 $(@D)/target/*-linux-gnu/release/mold $(HOST_DIR)/bin/mold
    $(INSTALL) -D -m 0755 $(@D)/target/*-linux-gnu/release/mold-wrapper.so $(HOST_DIR)/lib/mold/mold-wrapper.so
    # create GNU linker links (relative, so the host dir stays relocatable)
    ln -sf $(HOST_DIR)/bin/mold $(HOST_DIR)/$(GNU_TARGET_NAME)/bin/ld.mold
    ln -sf $(HOST_DIR)/bin/mold $(HOST_DIR)/bin/$(GNU_TARGET_NAME)-ld.mold
    ln -sf $(HOST_DIR)/bin/mold $(HOST_DIR)/bin/$(call qstrip,$(BR2_ARCH))-linux-ld.mold
    ln -sf $(HOST_DIR)/bin/mold $(HOST_DIR)/libexec/mold/ld
endef

HOST_MOLD_POST_INSTALL_HOOKS += MOLD_INSTALL

$(eval $(host-generic-package))