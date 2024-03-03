################################################################################
#
# p7zip
#
################################################################################

P7ZIP_VERSION = 2301
P7ZIP_SOURCE = 7z$(P7ZIP_VERSION)-src.tar.xz
P7ZIP_SITE = https://www.7-zip.org/a
P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
P7ZIP_LICENSE_FILES = DOC/License.txt
P7ZIP_CPE_ID_VENDOR = 7-zip

ifeq ($(BR2_PACKAGE_P7ZIP_7ZA),y)
P7ZIP_TARGET = $(@D)/CPP/7zip/Bundles/Alone
PZIP_FILE = 7za
else
P7ZIP_TARGET = $(@D)/CPP/7zip/Bundles/Alone7z
PZIP_FILE = 7zr
endif

# p7zip buildsystem is a mess: it plays dirty tricks with CFLAGS and
# CXXFLAGS, so we can't pass them. Instead, it accepts ALLFLAGS_C
# and ALLFLAGS_CPP as variables to pass the CFLAGS and CXXFLAGS.
define P7ZIP_BUILD_CMDS
	rm -r $(@D)/*
	cd  $(@D) && tar -xf $(P7ZIP_DL_DIR)/$($(PKG)_SOURCE)
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/CPP/7zip/7zip_gcc.mak
	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(P7ZIP_TARGET) -f makefile.gcc
endef

define P7ZIP_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(P7ZIP_TARGET)/_o/$(PZIP_FILE) $(TARGET_DIR)/usr/bin/$(PZIP_FILE)
endef

# batocera
define HOST_P7ZIP_BUILD_CMDS
	rm -r $(@D)/*
	cd  $(@D) && tar -xf $(P7ZIP_DL_DIR)/$($(PKG)_SOURCE)
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(P7ZIP_TARGET) -f makefile.gcc
endef

# batocera
define HOST_P7ZIP_INSTALL_CMDS
	$(INSTALL) -D -m 0755 $(P7ZIP_TARGET)/_o/$(PZIP_FILE) $(HOST_DIR)/usr/bin/$(PZIP_FILE)
endef

$(eval $(generic-package))
# batocera
$(eval $(host-generic-package))
