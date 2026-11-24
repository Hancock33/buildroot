################################################################################
#
# libyaml
#
################################################################################

LIBYAML_VERSION = 0.2.7
LIBYAML_SITE = $(call github,yaml,libyaml,$(LIBYAML_VERSION))
LIBYAML_INSTALL_STAGING = YES
LIBYAML_LICENSE = MIT
LIBYAML_LICENSE_FILES = License
LIBYAML_CPE_ID_VENDOR = pyyaml

$(eval $(autotools-package))
$(eval $(host-autotools-package))
