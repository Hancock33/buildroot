################################################################################
#
# tbb
#
################################################################################

TBB_VERSION = 2021.13.0
TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
TBB_INSTALL_STAGING = YES
TBB_LICENSE = Apache-2.0
TBB_LICENSE_FILES = LICENSE.txt
TBB_CPE_ID_VENDOR = intel
TBB_CPE_ID_PRODUCT = threading_building_blocks

TBB_CONF_OPTS = \
	-DCMAKE_BUILD_TYPE=Release \
	-DTBB_STRICT=OFF \
	-DTBB_TEST=OFF \
	-DBUILD_SHARED_LIBS=OFF \
	-DCMAKE_INSTALL_PREFIX=/usr/lib/tbb

HOST_TBB_CONF_OPTS = \
	-DCMAKE_BUILD_TYPE=Release \
	-DTBB_STRICT=OFF \
	-DTBB_TEST=OFF


$(eval $(cmake-package))
$(eval $(host-cmake-package))
