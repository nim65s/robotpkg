# robotpkg Makefile for:	math/eigen-quadprog
# Created:			Rohan Budhiraja on Tue, 14 Apr 2020
#

ORG=			jrl-umi3218
NAME=			eigen-quadprog
VERSION=		1.0.1
PKGREVISION=		1

PKGNAME=		${NAME}-${VERSION}
DISTNAME=		${NAME}-v${VERSION}

CATEGORIES=		math
COMMENT=		QuadProg QP solver using the Eigen3 library
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gepetto@laas.fr

DYNAMIC_PLIST_DIRS+=	share/doc/${NAME}

CMAKE_ARGS+=		-DCMAKE_POLICY_VERSION_MINIMUM=3.5

# man pages location
CMAKE_ARGS+=		-DMANDIR=${PREFIX}/${PKGMANDIR}

include ../../devel/jrl-cmakemodules/Makefile.common
include ../../math/eigen3/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
