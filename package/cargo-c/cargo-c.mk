################################################################################
#
# cargo-c
#
################################################################################

CARGO_C_VERSION = 0.10.18
CARGO_C_SITE = $(call github,lu-zero,cargo-c,v$(CARGO_C_VERSION))
CARGO_C_CARGO_LOCK_FILE = https://github.com/lu-zero/cargo-c/releases/download/v$(CARGO_C_VERSION)/Cargo.lock
CARGO_C_LICENSE = MIT
CARGO_C_LICENSE_FILES = LICENSE

HOST_CARGO_C_DEPENDENCIES = host-libopenssl host-pkgconf

$(eval $(host-cargo-package))
