# robotpkg Makefile for:	graphics/gz-common
# Created:			Anthony Mallet on Mon, 10 Feb 2025
#

PKGREVISION=	1
DISTNAME=	gz-common-6.0.0

GZ_COMMENT=	AV, Graphics, Events, and much more
CATEGORIES=	graphics

include ../../simulation/gz-sim/Makefile.common

CMAKE_ARGS+=	-DGZ_PROFILER_REMOTERY=OFF

DEPEND_ABI.g++ +=	g++>=9
DEPEND_ABI.gz-math+=	gz-math>=8<9
DEPEND_ABI.gz-utils+=	gz-utils>=3<4
DEPEND_ABI.libavdevice+=libavdevice>=2.8.22 # 56.4.100

include ../../devel/gz-utils/depend.mk
include ../../devel/spdlog/depend.mk
include ../../math/gz-math/depend.mk
include ../../mk/sysdep/freeimage.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/gdal.mk
include ../../mk/sysdep/libavcodec.mk
include ../../mk/sysdep/libavdevice.mk
include ../../mk/sysdep/libavformat.mk
include ../../mk/sysdep/libavutil.mk
include ../../mk/sysdep/libuuid.mk
include ../../mk/sysdep/libswscale.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
