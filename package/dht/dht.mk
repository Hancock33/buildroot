################################################################################
#
# dht
#
################################################################################

DHT_VERSION = 0.27-2-g38c9f261d9b58b76b9eaf85f84ec1b35151a1eac
DHT_SITE = $(call github,transmission,dht,dht-$(DHT_VERSION))
DHT_LICENSE = MIT
DHT_LICENSE_FILES = LICENCE
DHT_INSTALL_STAGING = YES

DHT_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc

$(eval $(cmake-package))
