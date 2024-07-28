################################################################################
#
# fbv
#
################################################################################

FBV_VERSION = 127dd84cede022cd5173ff2d7450677a14486784
FBV_SITE = git://repo.or.cz/fbv.git
FBV_SITE_METHOD=git

FBV_LICENSE = GPL-2.0
FBV_LICENSE_FILES = COPYING
FBV_AUTORECONF = YES

FBV_DEPENDENCIES += libpng

$(eval $(autotools-package))
