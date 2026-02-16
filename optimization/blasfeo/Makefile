# robotpkg Makefile for:	optimization/blasfeo
# Created:			Guilhem Saurel on Mon, 16 Jan 2026
#

DISTNAME=		blasfeo-0.1.4.2
MASTER_SITES=		${MASTER_SITE_GITHUB:=giaf/}

CATEGORIES=		optimization
COMMENT=		Basic linear algebra subroutines for embedded optimization
LICENSE=		2-clause-bsd
MAINTAINER=		guilhem.saurel@laas.fr

CMAKE_ARGS+=		-DBUILD_SHARED_LIBS=ON

include ../../mk/fetch/github.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

include ../../mk/robotpkg.mk
