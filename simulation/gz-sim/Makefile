# robotpkg Makefile for:	simulation/gz-sim
# Created:			Anthony Mallet on Wed,  5 Mar 2025
#

DISTNAME=	gz-sim-9.0.0

GZ_COMMENT=	robotic simulator
CATEGORIES=	simulation

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DENABLE_PROFILER=OFF
CMAKE_ARGS+=	-DSKIP_PYBIND11=ON

DEPEND_ABI.g++ +=		g++>=9.1
DEPEND_ABI.gz-common+=		gz-common>=6<7
DEPEND_ABI.gz-fuel-tools+=	gz-fuel-tools>=10<11
DEPEND_ABI.gz-gui+=		gz-gui>=9<10
DEPEND_ABI.gz-math+=		gz-math>=8<9
DEPEND_ABI.gz-msgs+=		gz-msgs>=11<12
DEPEND_ABI.gz-utils+=		gz-utils>=3<4
DEPEND_ABI.gz-physics+=		gz-physics>=8<9
DEPEND_ABI.gz-plugin+=		gz-plugin>=3<4
DEPEND_ABI.gz-rendering+=	gz-rendering>=9<10
DEPEND_ABI.gz-sensors+=		gz-sensors>=9<10
DEPEND_ABI.sdformat+=		sdformat>=15<16

include ../../devel/gz-plugin/depend.mk
include ../../devel/gz-utils/depend.mk
include ../../graphics/gz-common/depend.mk
include ../../graphics/gz-gui/depend.mk
include ../../graphics/gz-rendering/depend.mk
include ../../graphics/sdformat/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../math/gz-math/depend.mk
include ../../net/gz-fuel-tools/depend.mk
include ../../simulation/gz-physics/depend.mk
include ../../simulation/gz-sensors/depend.mk
include ../../sysutils/gz-tools/depend.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/sysdep/qt5-declarative.mk
include ../../mk/sysdep/qt5-quickcontrols2.mk
include ../../mk/robotpkg.mk
