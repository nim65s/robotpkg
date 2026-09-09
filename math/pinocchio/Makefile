# robotpkg Makefile for:	math/pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

ORG=			stack-of-tasks
NAME=			pinocchio
VERSION=		4.1.0

CATEGORIES=		math
COMMENT=		Efficient rigid body dynamics
HOMEPAGE=		http://${ORG}.github.io/${NAME}/

USE_MASTER_GITHUB=	true
include ../../devel/jrl-cmakemodules/Makefile.common

CMAKE_ARGS+=		-DBUILD_WITH_CASADI_SUPPORT=ON
CMAKE_ARGS+=		-DBUILD_WITH_COLLISION_SUPPORT=ON
CMAKE_ARGS+=		-DBUILD_BENCHMARK=OFF
CMAKE_ARGS+=		-DBUILD_EXAMPLES=OFF
CMAKE_ARGS+=		-DBUILD_TESTING=OFF
CMAKE_ARGS+=		-DBUILD_UTILS=OFF
CMAKE_ARGS+=		-DBUILD_TESTS_WITH_HPP=OFF
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF
CMAKE_ARGS+=		-DINSTALL_DOCUMENTATION=OFF

USE_BOOST_LIBS=		filesystem serialization

include ../../graphics/urdfdom/depend.mk
include ../../math/eigen3/depend.mk
include ../../path/coal/depend.mk
include ../../mapping/octomap/depend.mk
include ../../optimization/casadi/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk

DEPEND_ABI.urdfdom+=	urdfdom>=0.2.3

include ../../mk/robotpkg.mk
