################################################################################
#
# vulkan-sdk
#
################################################################################
# Version: Commits on Nov 28, 2025
VULKAN_SDK_VERSION = 4f3bcee79618a9abe79f4c717c50379197c77512
VULKAN_SDK_BRANCH = vulkan-sdk-1.4.335
VULKAN_SDK_SITE = $(call github,zeux,volk,$(VULKAN_SDK_VERSION))
VULKAN_SDK_LICENSE = MIT
VULKAN_SDK_LICENSE_FILES = LICENSE.md
VULKAN_SDK_INSTALL_STAGING = YES

VULKAN_SDK_DEPENDENCIES = vulkan-headers vulkan-loader

VULKAN_SDK_CONF_OPTS += -DVOLK_INSTALL=ON

$(eval $(cmake-package))
