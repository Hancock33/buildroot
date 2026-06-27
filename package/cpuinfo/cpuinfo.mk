################################################################################
#
# cpuinfo
#
################################################################################
# Version: Commits on Jun 17, 2026
CPUINFO_VERSION = 315d03cacc51bfabe316057b0d3466e13bce88a0
CPUINFO_SITE = $(call github,pytorch,cpuinfo,$(CPUINFO_VERSION))
CPUINFO_LICENSE = BSD-2-Clause
CPUINFO_LICENSE_FILES = LICENSE
CPUINFO_INSTALL_STAGING = YES
CPUINFO_CONF_OPTS = \
	-DCPUINFO_BUILD_UNIT_TESTS=OFF \
	-DCPUINFO_BUILD_MOCK_TESTS=OFF \
	-DCPUINFO_BUILD_BENCHMARKS=OFF

$(eval $(cmake-package))
