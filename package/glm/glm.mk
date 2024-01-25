################################################################################
#
# glm
#
################################################################################

GLM_VERSION = 1.0.0
GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
GLM_LICENSE = MIT
GLM_LICENSE_FILES = copying.txt

# GLM is a header-only library, it only makes sense
# to have it installed into the staging directory.
GLM_INSTALL_STAGING = YES

# Don't build libraries as GLM is header-only
# Batocera - enable shared libs for cemu
GLM_CONF_OPTS = \
	-DGLM_TEST_ENABLE=OFF \
	-DBUILD_SHARED_LIBS=ON \
	-DBUILD_STATIC_LIBS=OFF

$(eval $(cmake-package))
