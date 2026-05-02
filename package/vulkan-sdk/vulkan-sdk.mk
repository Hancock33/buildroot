################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on May 01, 2026
VULKAN_SDK_VERSION = 3ca312a4f38baa63d8006b6905abbeeb89c8087d
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers vulkan-loader

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
