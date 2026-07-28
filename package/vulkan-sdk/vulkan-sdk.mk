################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on Jul 18, 2026
VULKAN_SDK_VERSION = vulkan-sdk-1.4.357.0
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers vulkan-loader

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
