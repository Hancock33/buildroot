################################################################################
#
# glm
#
################################################################################

GLM_VERSION = b06b775c1c80af51a1183c0e167f9de3b2351a79
GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
GLM_LICENSE = MIT
GLM_LICENSE_FILES = copying.txt

# GLM is a header-only library, it only makes sense
# to have it installed into the staging directory.
GLM_INSTALL_STAGING = YES
GLM_INSTALL_TARGET = NO

# Don't build libraries as GLM is header-only
GLM_CONF_OPTS = \
	-DGLM_TEST_ENABLE=OFF \
	-DBUILD_SHARED_LIBS=OFF \
	-DBUILD_STATIC_LIBS=OFF

$(eval $(cmake-package))
