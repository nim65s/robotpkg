# robotpkg Makefile for:	path/py38-coal
# Created:			Guilhem Saurel on Tue, 19 Nov 2019
#

ORG=			coal-library
NAME=			coal
VERSION=		3.0.4

CATEGORIES=		path
HPP_COMMENT=		collision detection and distance computations (python bindingss)
LICENSE=		2-clause-bsd
CONFLICTS+=		${PKGTAG.python-}hpp-fcl-[0-9]*

USE_MASTER_GITHUB=	true
USE_PYTHON_ONLY=	yes
include ../../devel/jrl-cmakemodules/Makefile.common

CMAKE_ARGS+=		-DENABLE_PYTHON_DOXYGEN_AUTODOC=OFF

CMAKE_ARGS+=		-DCOAL_BACKWARD_COMPATIBILITY_WITH_HPP_FCL=ON
CMAKE_ARGS+=		-DHPP_FCL_HAS_QHULL=ON

USE_BOOST_LIBS=		serialization filesystem log

DEPEND_ABI.assimp+=	assimp>=5

include ../../mapping/octomap/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/coal/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qhull.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
