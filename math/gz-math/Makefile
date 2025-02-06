# robotpkg Makefile for:	devel/gz-math
# Created:			Anthony Mallet on Thu,  6 Feb 2025
#

DISTNAME=	gz-math-8.0.0

GZ_COMMENT=	math classes and functions designed for robotic applications
CATEGORIES=	math

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DSKIP_SWIG=ON

DEPEND_ABI.gz-utils+=	gz-utils>=3<4

include ../../devel/gz-utils/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/robotpkg.mk
