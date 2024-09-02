################################################################################
#
# enet
#
################################################################################
# Version: Commits on Apr 15, 2024
ENET_VERSION = 1.3.18
ENET_SITE = $(call github,lsalzman,enet,v$(ENET_VERSION))
ENET_LICENSE = MIT
ENET_LICENSE_FILES = LICENSE
ENET_AUTORECONF = YES

ENET_INSTALL_STAGING = YES

$(eval $(autotools-package))
