# robotpkg Makefile for:	path/coal
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

ORG=			coal-library
NAME=			coal
VERSION=		3.0.2

CATEGORIES=		path
COMMENT=		collision detection and distance computations
LICENSE=		2-clause-bsd
CONFLICTS+=		hpp-fcl-[0-9]*

USE_MASTER_GITHUB=	true

# boost-1.47.0 has -Wconversion warnings in date_time/posix_time/posix_time.hpp
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF
CMAKE_ARGS+=		-DCOAL_BACKWARD_COMPATIBILITY_WITH_HPP_FCL=ON
CMAKE_ARGS+=		-DHPP_FCL_HAS_QHULL=ON

USE_BOOST_LIBS=		thread date_time system filesystem test chrono
DEPEND_ABI.assimp+=	assimp>=5

include ../../devel/jrl-cmakemodules/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/qhull.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
