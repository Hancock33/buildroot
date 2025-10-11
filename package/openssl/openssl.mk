################################################################################
#
# openssl
#
################################################################################
# The package is a dependency to ccache so ccache cannot be a dependency
HOST_OPENSSL_ADD_CCACHE_DEPENDENCY = NO

$(eval $(virtual-package))
$(eval $(host-virtual-package))
