################################################################################
#
# qt6wayland
#
################################################################################

QT6WAYLAND_VERSION = $(QT6_VERSION)
QT6WAYLAND_SITE = $(QT6_SITE)
QT6WAYLAND_SOURCE = qtwayland-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6WAYLAND_VERSION).tar.xz
QT6WAYLAND_INSTALL_STAGING = YES
QT6WAYLAND_SUPPORTS_IN_SOURCE_BUILD = NO
QT6WAYLAND_CMAKE_BACKEND = ninja

# host-qt6wayland needed to build the qtwaylandscanner host tool
QT6WAYLAND_DEPENDENCIES = qt6base wayland host-qt6wayland

QT6WAYLAND_LICENSE = \
	BSD-3-Clause (examples, tests), \
	GPL-3.0 (compositor), \
	LGPL-3.0 or GPL-2.0 or GPL-3.0, \
	GPL-3.0 WITH Qt-GPL-exception-1.0 (tests), \
	GFDL-1.3 no invariants (docs)

QT6WAYLAND_LICENSE_FILES = \
	LICENSES/BSD-3-Clause.txt \
	LICENSES/GPL-2.0-only.txt \
	LICENSES/GPL-3.0-only.txt \
	LICENSES/LGPL-3.0-only.txt \
	LICENSES/GFDL-1.3-no-invariants-only.txt

QT6WAYLAND_CONF_OPTS = \
	-DQT_HOST_PATH=$(HOST_DIR) \
	-DFEATURE_wayland_client=ON \
	$(QT6_COMMON_CONF_OPTS)


HOST_QT6WAYLAND_DEPENDENCIES = host-qt6base
HOST_QT6WAYLAND_CONF_OPTS = \
	-DFEATURE_wayland_client=OFF \
	-DFEATURE_wayland_server=OFF \
	$(QT6_COMMON_CONF_OPTS)

$(eval $(cmake-package))
$(eval $(host-cmake-package))
