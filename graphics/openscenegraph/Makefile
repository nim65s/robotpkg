# robotpkg Makefile for:	graphics/openscenegraph
# Created:			Guilhem Saurel on Mon, 25 May 2020
#

PKGREVISION=		5
ORG=			openscenegraph
NAME=			OpenSceneGraph
VERSION=		3.6.5
DISTNAME=		${NAME}-${VERSION}
PKGNAME=		${ORG}-${VERSION}

MASTER_SITES=		${MASTER_SITE_GITHUB:=${ORG}/${NAME}}/archive/
WRKSRC=			${WRKDIR}/${NAME}-${DISTNAME}

CATEGORIES=		graphics
COMMENT=		open source high performance 3D graphics toolkit
LICENSE=		gnu-lgpl-v2.1
MAINTAINER=		gsaurel@laas.fr

CONFIGURE_ENV+=		COLLADA_DIR=${PREFIX.collada-dom}
CMAKE_ARGS+=		-DCOLLADA_DOM_2_4_OR_LATER=ON
CMAKE_ARGS+=		-DCMAKE_POLICY_VERSION_MINIMUM=3.5

include ../../graphics/collada-dom/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/mesa.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
