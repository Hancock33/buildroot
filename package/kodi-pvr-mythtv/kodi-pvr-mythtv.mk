################################################################################
#
# kodi-pvr-mythtv
#
################################################################################

KODI_PVR_MYTHTV_VERSION = 883f91737d4e75cf0aa5cdb22970190dee05e722
KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
KODI_PVR_MYTHTV_DEPENDENCIES = kodi

$(eval $(cmake-package))
