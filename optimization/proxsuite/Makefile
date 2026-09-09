# robotpkg Makefile for:	math/proxsuite
# Created:			Guilhem Saurel on Mon, 26 Sep 2022
#

PKGREVISION=		1
ORG=			Simple-Robotics
NAME=			proxsuite
VERSION=		0.7.3

DISTNAME=		${NAME}-${VERSION}
GITHUB_RELEASE=		v${VERSION}
GITHUB_DISTFILE=	${DISTNAME}${EXTRACT_SUFX}

MASTER_SITES=		${MASTER_SITE_GITHUB:=${ORG}/}

CATEGORIES=		optimization
COMMENT=		The Advanced Proximal Optimization Toolbox
LICENSE=		modified-bsd
MAINTAINER=		gsaurel@laas.fr

include ../../devel/jrl-cmakemodules/Makefile.common

DEPEND_ABI.cmake=	cmake>=3.10
CMAKE_ARGS+=		-DEigen3_INCLUDE_DIR=${PREFIX.eigen3}/include/eigen3
CMAKE_ARGS+=		-DBUILD_TESTING=OFF
CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

include ../../devel/visit-struct/depend.mk
include ../../hardware/simde/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
