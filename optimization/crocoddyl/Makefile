# robotpkg Makefile for:	optimization/crocoddyl
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

ORG=			loco-3d
NAME=			crocoddyl
VERSION=		3.2.1

CATEGORIES=		optimization
COMMENT=		Optimal control library for robot under contact sequence
LICENSE=		2-clause-bsd
MAINTAINER=		guilhem.saurel@laas.fr

USE_MASTER_GITHUB=	true

include ../../devel/jrl-cmakemodules/Makefile.common

# parallel builds exhaust memory - until a better solution is found
MAKE_JOBS_SAFE=		no

CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

DEPEND_ABI.pinocchio=	pinocchio>=2.6.3

include ../../graphics/urdfdom/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../optimization/ipopt/depend.mk
include ../../path/coal/depend.mk
include ../../robots/example-robot-data/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
