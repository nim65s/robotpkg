# robotpkg Makefile for:	devel/gz-cmake
# Created:			Anthony Mallet on Wed,  5 Feb 2025
#

DISTNAME=	gz-cmake-4.0.0
MASTER_SITES=	${MASTER_SITE_GITHUB:=gazebosim/}

GZ_COMMENT=	common cmake modules
CATEGORIES=	devel

USE_GZ_CMAKE?=	no
include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DBUILDSYSTEM_TESTING=OFF

include ../../mk/robotpkg.mk
