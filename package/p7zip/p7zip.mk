################################################################################
#
# p7zip
#
################################################################################

P7ZIP_VERSION = 2408
P7ZIP_SOURCE = 7z$(P7ZIP_VERSION)-src.tar.xz
P7ZIP_SITE = https://www.7-zip.org/a
P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
P7ZIP_LICENSE_FILES = DOC/License.txt
P7ZIP_CPE_ID_VENDOR = 7-zip

P7A_TARGET = $(@D)/CPP/7zip/Bundles/Alone
P7A_FILE = 7za
P7R_TARGET = $(@D)/CPP/7zip/Bundles/Alone7z
P7R_FILE = 7zr

# p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
# CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
# and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
define P7ZIP_BUILD_CMDS
	rm -r $(@D)/*
	cd  $(@D) && tar -xf $(P7ZIP_DL_DIR)/$($(PKG)_SOURCE)
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/CPP/7zip/7zip_gcc.mak
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(P7A_TARGET) -f makefile.gcc
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(P7R_TARGET) -f makefile.gcc
endef

define P7ZIP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(P7A_TARGET)/_o/$(P7A_FILE) $(TARGET_DIR)/usr/bin/$(P7A_FILE)
	$(INSTALL) -D -m 0755 $(P7R_TARGET)/_o/$(P7R_FILE) $(TARGET_DIR)/usr/bin/$(P7R_FILE)
endef

# batocera
define HOST_P7ZIP_BUILD_CMDS
	rm -r $(@D)/*
	cd  $(@D) && tar -xf $(P7ZIP_DL_DIR)/$($(PKG)_SOURCE)
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(P7A_TARGET) -f makefile.gcc
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(P7R_TARGET) -f makefile.gcc
endef

# batocera
define HOST_P7ZIP_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(P7A_TARGET)/_o/$(P7A_FILE) $(HOST_DIR)/usr/bin/$(P7A_FILE)
	$(INSTALL) -D -m 0755 $(P7R_TARGET)/_o/$(P7R_FILE) $(HOST_DIR)/usr/bin/$(P7R_FILE)
endef

$(eval $(generic-package))
# batocera
$(eval $(host-generic-package))
