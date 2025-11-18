################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on Nov 16, 2025
VULKAN_SDK_VERSION = b131b168d833f4d6bbe2e5bc8d41fb9792f818f8
VULKAN_SDK_BRANCH = vulkan-tmp-1.4.333
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers vulkan-loader

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
