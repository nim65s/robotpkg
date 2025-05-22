# robotpkg Makefile for:	graphics/sdformat
# Created:			Anthony Mallet on Fri, 7 Feb 2025
#

DISTNAME=	sdformat-15.0.0

COMMENT=	File format that describes environments, objects, and robots
CATEGORIES=	graphics

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DUSE_INTERNAL_URDF=OFF
CMAKE_ARGS+=	-DGZ_PROGRAM=OFF # actually not used

DEPEND_ABI.gz-utils+=	gz-utils>=3<4
DEPEND_ABI.gz-math+=	gz-math>=8<9
DEPEND_ABI.urdfdom+=	urdfdom>=1.0

include ../../devel/gz-utils/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../math/gz-math/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
