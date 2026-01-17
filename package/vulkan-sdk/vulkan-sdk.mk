################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on Jan 10, 2026
VULKAN_SDK_VERSION = d34b5e0d46b28c22d69b97ee7da074b6e68d9e25
VULKAN_SDK_BRANCH = vulkan-tmp-1.4.338
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers vulkan-loader

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
