################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on Sept 26, 2025
VULKAN_SDK_VERSION = f30088b3f4160810b53e19258dd2f7395e5f0ba3
VULKAN_SDK_BRANCH = vulkan-sdk-1.4.328
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers vulkan-loader

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
