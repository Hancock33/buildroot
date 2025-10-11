################################################################################
#
# stb
#
################################################################################
# Version: Commits on Oct 02, 2025
STB_VERSION = 1.0.0
STB_SITE = $(call github,KabelitzJ,stb,$(STB_VERSION))
STB_LICENSE = Public Domain or MIT
STB_LICENSE_FILES = LICENSE
STB_INSTALL_STAGING = YES
STB_INSTALL_TARGET = NO

$(eval $(cmake-package))
