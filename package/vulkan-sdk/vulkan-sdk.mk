################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on Nov 16, 2026
VULKAN_SDK_VERSION = 051977aa2412e8a1b3f5362c975bba99c4728703
VULKAN_SDK_BRANCH = vulkan-tmp-1.4.368
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
