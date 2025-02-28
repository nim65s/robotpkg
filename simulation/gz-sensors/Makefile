# robotpkg Makefile for:	simulation/gz-sensors
# Created:			Anthony Mallet on Fri, 28 Feb 2025
#

DISTNAME=	gz-sensors-9.0.0

GZ_COMMENT=	sensor models for simulation
CATEGORIES=	simulation hardware

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DENABLE_PROFILER=OFF
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_gz-rendering9-ogre=TRUE

DEPEND_ABI.gz-common+=		gz-common>=6<7
DEPEND_ABI.gz-math+=		gz-math>=8<9
DEPEND_ABI.gz-msgs+=		gz-msgs>=11<12
DEPEND_ABI.gz-rendering+=	gz-rendering>=9<10
DEPEND_ABI.gz-tools+=		gz-tools>=2<3
DEPEND_ABI.gz-transport+=	gz-transport>=14<15
DEPEND_ABI.sdformat+=		sdformat>=15<16

include ../../graphics/gz-common/depend.mk
include ../../graphics/gz-rendering/depend.mk
include ../../graphics/sdformat/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../math/gz-math/depend.mk
include ../../net/gz-transport/depend.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/robotpkg.mk
