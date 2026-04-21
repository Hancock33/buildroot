################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on Apr 10, 2026
VULKAN_SDK_VERSION = d41d1af15680c369b182fb913a6fb133045b0077
VULKAN_SDK_BRANCH = vulkan-tmp-1.4.349
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers vulkan-loader

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
