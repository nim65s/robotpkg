# robotpkg Makefile for:	math/libccd
# Created:			Anthony Mallet on Tue, 28 Apr 2015
#

DISTNAME=	libccd-2.1
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=danfis/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://libccd.danfis.cz/
COMMENT=	collision detection
LICENSE=	modified-bsd

CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib

# compatibility with cmake>=4
CMAKE_ARGS+=\
  $(if $(filter cmake-4.%,${PKGVERSION.cmake}), \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5)

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
