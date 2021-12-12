################################################################################
#
# kodi-pvr-nextpvr
#
################################################################################

KODI_PVR_NEXTPVR_VERSION = 19.0.2-Matrix
KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
KODI_PVR_NEXTPVR_DEPENDENCIES = kodi tinyxml2

$(eval $(cmake-package))
