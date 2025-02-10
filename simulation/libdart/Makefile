# robotpkg Makefile for:	simulation/libdart
# Created:			Anthony Mallet on Mon, 10 Feb 2025
#

DISTNAME=	dart-6.15.0
PKGNAME=	lib${DISTNAME}
CATEGORIES=	simulation
MASTER_SITES=	${MASTER_SITE_GITHUB:=dartsim/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	https://dartsim.github.io/
COMMENT=	Dynamic Animation and Robotics Toolkit
LICENSE=	2-clause-bsd

# enable required features
CMAKE_ARGS+=	-DFETCHCONTENT_FULLY_DISCONNECTED=ON
CMAKE_ARGS+=	-DDART_ENABLE_SIMD=ON
CMAKE_ARGS+=	-DBUILD_SHARED_LIBS=ON
CMAKE_ARGS+=    -DCMAKE_INSTALL_LIBDIR=lib

# disable unwanted features
CMAKE_ARGS+=	-DBUILD_TESTING=OFF
CMAKE_ARGS+=	-DDART_BUILD_DARTPY=OFF
CMAKE_ARGS+=	-DDART_BUILD_GUI_OSG=OFF
CMAKE_ARGS+=	-DDART_BUILD_PROFILE=OFF
CMAKE_ARGS+=	-DDART_BUILD_WHEELS=OFF

CMAKE_ARGS+=	-DDART_CODECOV=OFF
CMAKE_ARGS+=	-DIPOPT_LIBRARIES=OFF
CMAKE_ARGS+=	-DNLOPT_LIBRARIES=OFF
CMAKE_ARGS+=	-Dpagmo=OFF

# optional documentation
PKG_SUGGESTED_OPTIONS+=	doc
PKG_SUPPORTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc=	Enable documentation generation and installation
define PKG_OPTION_SET.doc
  DYNAMIC_PLIST_DIRS+=          share/doc/dart
  include ../../mk/sysdep/doxygen.mk
endef
define PKG_OPTION_UNSET.doc
CMAKE_ARGS+=	-DDOXYGEN=OFF
endef

DEPEND_ABI.assimp+= assimp>=5.2.0
DEPEND_ABI.g++ += g++>=11.2.0
DEPEND_ABI.ode+= ode>=0.16.2

include ../../devel/spdlog/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/libccd/depend.mk
include ../../math/eigen3/depend.mk
include ../../path/fcl/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/bullet.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/ode.mk
include ../../mk/sysdep/freeglut.mk
include ../../mk/sysdep/libfmt.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
