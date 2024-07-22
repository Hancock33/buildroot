################################################################################
#
# dotnet-runtime-prebuilt
#
################################################################################

DOTNET_RUNTIME_PREBUILT_VERSION = 8.0.303
DOTNET_RUNTIME_PREBUILT_LICENSE = MIT
DOTNET_RUNTIME_PREBUILT_SITE = https://download.visualstudio.microsoft.com/download/pr/60218cc4-13eb-41d5-aa0b-5fd5a3fb03b8/6c42bee7c3651b1317b709a27a741362
DOTNET_RUNTIME_PREBUILT_SOURCE = dotnet-sdk-$(DOTNET_RUNTIME_PREBUILT_VERSION)-linux-x64.tar.gz

define DOTNET_RUNTIME_PREBUILT_INSTALL_TARGET_CMDS
	mkdir $(HOST_DIR)/dotnet
	cp -Rf $(@D)/. $(HOST_DIR)/dotnet
endef

$(eval $(generic-package))
