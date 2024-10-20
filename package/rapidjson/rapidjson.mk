################################################################################
#
# rapidjson
#
################################################################################
# Version: Commits on Oct 06, 2024
RAPIDJSON_VERSION = 858451e5b7d1c56cf8f6d58f88cf958351837e53
RAPIDJSON_SITE = $(call github,Tencent,rapidjson,$(RAPIDJSON_VERSION))
RAPIDJSON_LICENSE = MIT
RAPIDJSON_LICENSE_FILES = license.txt
RAPIDJSON_CPE_ID_VENDOR = tencent

# rapidjson is a header-only C++ library
RAPIDJSON_INSTALL_TARGET = NO
RAPIDJSON_INSTALL_STAGING = YES

RAPIDJSON_CONF_OPTS = \
	-DRAPIDJSON_BUILD_DOC=OFF \
	-DRAPIDJSON_BUILD_EXAMPLES=OFF \
	-DRAPIDJSON_BUILD_TESTS=OFF

$(eval $(cmake-package))
