################################################################################
#
# enet
#
################################################################################
# Version: Commits on Jul 24, 2023
ENET_VERSION = 2a85cd64459f6ba038d233a634d9440490dbba12
ENET_SITE = $(call github,lsalzman,enet,$(ENET_VERSION))
ENET_LICENSE = MIT
ENET_LICENSE_FILES = LICENSE
ENET_AUTORECONF = YES

ENET_INSTALL_STAGING = YES

$(eval $(autotools-package))
