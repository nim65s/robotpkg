# robotpkg Makefile for:	motion/sot-core
# Created:			Florent Lamiraux on Fri, 8 Jul 2011
#

PKGNAME=		sot-core-${VERSION}
DISTNAME=		sot-core-${VERSION}
VERSION=		2.9.10
PKGREVISION=		0

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=sot-core/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_GITHUB}/stack-of-tasks/sot-core

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
COMMENT=	Hierarchical task based control of humanoid robots
LICENSE=	gnu-lgpl-v3

WRKSRC=		${WRKDIR}/${DISTNAME:a=}

DYNAMIC_PLIST_DIRS+=	share/doc/sot-core

CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}
CMAKE_ARGS+=		-DSPHINX_BUILD=${SPHINX_BUILD}
CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

include ../../motion/py-dynamic-graph/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/sysdep/py-sphinx.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build
