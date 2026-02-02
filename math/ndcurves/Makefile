# robotpkg Makefile for:	math/ndcurves
# Created:			Guilhem Saurel on Tue, 16 Mar 2021
#

ORG=			loco-3d
NAME=			ndcurves
VERSION=		2.1.0

CATEGORIES=		math
COMMENT=		Library for creating curves
LICENSE=		2-clause-bsd
MAINTAINER=		gepetto@laas.fr

CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

USE_MASTER_GITHUB=	true

include ../../devel/jrl-cmakemodules/depend.mk

include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
