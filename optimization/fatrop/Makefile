# robotpkg Makefile for:	optimization/fatrop
# Created:			Guilhem Saurel on Mon, 16 Jan 2026
#

DISTNAME=		fatrop-1.0.0
MASTER_SITES=		${MASTER_SITE_GITHUB:=meco-group/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

CATEGORIES=		optimization
COMMENT=		Nonlinear optimal control problem solver
LICENSE=		2-clause-bsd
MAINTAINER=		guilhem.saurel@laas.fr

CMAKE_ARGS+=		-DBUILD_WITH_BLASFEO=OFF

include ../../optimization/blasfeo/depend.mk
include ../../mk/fetch/github.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/googletest.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

include ../../mk/robotpkg.mk
