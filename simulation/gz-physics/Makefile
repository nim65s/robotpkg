# robotpkg Makefile for:	simulation/gz-physics
# Created:			Anthony Mallet on Mon, 10 Feb 2025
#

DISTNAME=	gz-physics-8.0.0

GZ_COMMENT=	physics classes and functions for robot applications
CATEGORIES=	simulation interfaces

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DENABLE_PROFILER=OFF

DEPEND_ABI.gz-common+=	gz-common>=6<7
DEPEND_ABI.gz-math+=	gz-math>=8<9
DEPEND_ABI.gz-utils+=	gz-utils>=3<4
DEPEND_ABI.libdart+=	libdart>=6.10
DEPEND_ABI.sdformat+=	sdformat>=15<16

include ../../devel/gz-plugin/depend.mk
include ../../devel/gz-utils/depend.mk
include ../../graphics/gz-common/depend.mk
include ../../graphics/sdformat/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/gz-math/depend.mk
include ../../simulation/libdart/depend.mk
include ../../mk/sysdep/bullet.mk
include ../../mk/robotpkg.mk
