################################################################################
#
# stb
#
################################################################################
# Version: Commits on Aug 02, 2025
STB_VERSION = 2c980bb59875b0d32144a71867fbdebb2f77cd20
STB_SITE = $(call github,nothings,stb,$(STB_VERSION))
STB_LICENSE = Public Domain or MIT
STB_LICENSE_FILES = LICENSE
STB_INSTALL_STAGING = YES
STB_INSTALL_TARGET = NO

define STB_INSTALL_STAGING_CMDS
	mkdir -p $(STAGING_DIR)/usr/include/stb
	$(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include/stb
	$(INSTALL) -D -m 0644 $(STB_PKGDIR)/stb.pc \
		$(STAGING_DIR)/usr/lib/pkgconfig/stb.pc
endef

$(eval $(generic-package))
