# robotpkg Makefile for:	graphics/gz-rendering
# Created:			Anthony Mallet on Wed, 12 Feb 2025
#

DISTNAME=	gz-rendering-9.0.0

GZ_COMMENT=	rendering library for robot applications
CATEGORIES=	graphics interfaces

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_CUDA=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_FreeImage=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_GzOGRE=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_OptiX=ON
CMAKE_ARGS+=	-DSKIP_ogre=ON
CMAKE_ARGS+=	-DSKIP_optix=ON

CMAKE_ARGS+=	-DOpenGL_GL_PREFERENCE=LEGACY

DEPEND_ABI.gz-common+=	gz-common>=6<7
DEPEND_ABI.gz-math+=	gz-math>=8<9
DEPEND_ABI.gz-plugin+=	gz-plugin>=3<4
DEPEND_ABI.gz-utils+=	gz-utils>=3<4
DEPEND_ABI.libavdevice+=libavdevice>=56.4.100
DEPEND_ABI.ogre-next+=	ogre-next>=2.3.1

include ../../devel/gz-plugin/depend.mk
include ../../devel/gz-utils/depend.mk
include ../../math/gz-math/depend.mk
include ../../graphics/ogre-next/depend.mk
include ../../graphics/gz-common/depend.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/robotpkg.mk
