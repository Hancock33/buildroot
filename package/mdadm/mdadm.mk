################################################################################
#
# mdadm
#
################################################################################

MDADM_VERSION = 4.3
MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
MDADM_LICENSE = GPL-2.0+
MDADM_LICENSE_FILES = COPYING
MDADM_CPE_ID_VALID = YES

MDADM_CXFLAGS = $(TARGET_CFLAGS) -fPIE

MDADM_BUILD_OPTS = \
	CC=$(TARGET_CC) \
	COROSYNC=-DNO_COROSYNC \
	DLM=-DNO_DLM \
	CWFLAGS="" \
	CXFLAGS="$(MDADM_CXFLAGS)" \
	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
	CHECK_RUN_DIR=0 \
	LDFLAGS="$(TARGET_LDFLAGS)"

MDADM_INSTALL_TARGET_OPTS = install-bin

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
MDADM_BUILD_OPTS += USE_PTHREADS=
endif

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
MDADM_DEPENDENCIES += udev
MDADM_INSTALL_TARGET_OPTS += install-udev
else
MDADM_CXFLAGS += -DNO_LIBUDEV
endif

define MDADM_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(MDADM_BUILD_OPTS) mdadm mdmon
endef

define MDADM_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) $(MDADM_INSTALL_TARGET_OPTS)
endef

$(eval $(generic-package))
