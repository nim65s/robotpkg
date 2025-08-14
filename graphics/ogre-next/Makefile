# robotpkg Makefile for:	graphics/ogre-next
# Created:			Anthony Mallet on Wed, 12 Feb 2025
#

DISTNAME=	ogre-next-2.3.3
MASTER_SITES=	${MASTER_SITE_GITHUB:=OGRECave/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

HOMEPAGE=	https://www.ogre3d.org/
COMMENT=	Object-Oriented Graphics Rendering Engine Next Generation
CATEGORIES=	graphics
LICENSE=	mit

# call me ogre-next
CMAKE_ARGS+=	-DOGRE_USE_NEW_PROJECT_NAME=ON

# enabled components
CMAKE_ARGS+=	-DOGRE_BUILD_COMPONENT_HLMS_PBS=ON
CMAKE_ARGS+=	-DOGRE_BUILD_COMPONENT_HLMS_UNLIT=ON
CMAKE_ARGS+=	-DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS=ON
CMAKE_ARGS+=	-DOGRE_BUILD_COMPONENT_OVERLAY=ON

CMAKE_ARGS+=	-DOGRE_BUILD_TOOLS=OFF
CMAKE_ARGS+=	-DOGRE_BUILD_SAMPLES2=OFF

# disable unwanted dependencies
CMAKE_ARGS+=	-DOGRE_CONFIG_ENABLE_ETC=OFF
CMAKE_ARGS+=	-DOGRE_CONFIG_ENABLE_ZIP=OFF
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_Boost=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_CppUnit=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_OpenVR=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_POCO=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_Remotery=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_RenderDoc=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_SDL2=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_Softimage=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_TBB=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_Vulkan=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON
CMAKE_ARGS+=	-DCMAKE_DISABLE_FIND_PACKAGE_ZZip=ON

CMAKE_ARGS+=	-DOpenGL_GL_PREFERENCE=LEGACY

include ../../archivers/zlib/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/freeimage.mk
include ../../mk/sysdep/freetype2.mk
include ../../mk/sysdep/glu.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/libX11.mk
include ../../mk/sysdep/libXaw.mk
include ../../mk/sysdep/libXrandr.mk
include ../../mk/sysdep/libXt.mk
include ../../mk/sysdep/rapidjson.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
