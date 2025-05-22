# robotpkg Makefile for:	hardware/librealsense
# Created:			Anthony Mallet on Wed,  2 Apr 2025
#

DISTNAME=	librealsense-2.56.3
MASTER_SITES=	${MASTER_SITE_GITHUB:=IntelRealSense/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

COMMENT=	SDK library for Intel® RealSense™ depth cameras
CATEGORIES=	hardware image
LICENSE=	apache-2.0

include ../../mk/robotpkg.prefs.mk # for OS_KERNEL

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib
CMAKE_ARGS+=	-DCHECK_FOR_UPDATES=OFF
CMAKE_ARGS+=	-DIMPORT_DEPTH_CAM_FW=OFF
CMAKE_ARGS+=	-DENABLE_CCACHE=OFF
ifneq (${OS_KERNEL},Linux)
  CMAKE_ARGS+=	-DFORCE_RSUSB_BACKEND=ON
endif

CMAKE_ARGS+=	-DBUILD_TOOLS=OFF
CMAKE_ARGS+=	-DBUILD_RS2_ALL=OFF
CMAKE_ARGS+=	-DBUILD_EXAMPLES=OFF

PKG_CONFIG_OVERRIDE=		config/realsense2.pc

# This requires nlohmann-json>=3.11.3, which is not widely available
# (e.g. Ubuntu>=24, Debian>=13, Fedora>=40). The build process downloads
# nlohmann-json from upstream during the configure step, but this is disabled
# by patch-ab per robotpkg policy.
# Since this is a pure build dependency, using an extra distfile is enough.
DISTFILES=	${GITHUB_DISTFILE} ${JSON_DISTFILE}

JSON_DISTFILE=	json-3.11.3.tar.gz
SITES.${JSON_DISTFILE}=\
  -${MASTER_SITE_GITHUB:=nlohmann/json}/archive/${JSON_DISTFILE:json-%=v%}

CPPFLAGS+=	-I${WRKDIR}/${JSON_DISTFILE:.tar.gz=}/include

ifeq (${OS_KERNEL},Linux)
  include ../../mk/sysdep/libudev.mk
endif
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/libusb1.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
