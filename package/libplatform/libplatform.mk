################################################################################
#
# libplatform
#
################################################################################

LIBPLATFORM_VERSION = 5a786dd580972a2dc89941ea60dc08c0314e0e4d
LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
LIBPLATFORM_LICENSE = GPL-2.0+
LIBPLATFORM_LICENSE_FILES = src/os.h
LIBPLATFORM_INSTALL_STAGING = YES

$(eval $(cmake-package))
