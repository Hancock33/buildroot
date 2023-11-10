################################################################################
#
# faad2
#
################################################################################

FAAD2_VERSION = 2.11.0
FAAD2_SITE = https://github.com/knik0/faad2/archive
FAAD2_SOURCE = $(FAAD2_VERSION).tar.gz
FAAD2_LICENSE = GPL-2.0
FAAD2_LICENSE_FILES = COPYING
FAAD2_CPE_ID_VENDOR = audiocoding
FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
# frontend/faad calls frexp()
FAAD2_CONF_ENV = LIBS=-lm
FAAD2_INSTALL_STAGING = YES

$(eval $(cmake-package))
