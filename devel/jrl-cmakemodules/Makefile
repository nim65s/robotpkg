# robotpkg Makefile for:	devel/jrl-cmakemodules
# Created:			Guilhem Saurel, Oct 27th 2025
#

DISTNAME=		jrl-cmakemodules-2.1.0
MASTER_SITES=		${MASTER_SITE_GITHUB:=jrl-umi3218/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

CATEGORIES=		devel
COMMENT=		CMake utility toolbox
MAINTAINER=		guilhem.saurel@laas.fr
LICENSE=		2-clause-bsd
HOMEPAGE=		${MASTER_SITES:=${PKGBASE}/}

DEPEND_ABI.cmake+=	cmake>=3.22

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
