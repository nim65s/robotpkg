# robotpkg Makefile for:	math/jrl-dynamics
# Created:			Anthony Mallet on Mon, 14 May 2007
#

PKGREVISION=	1
DISTNAME=	jrl-dynamics-${VERSION}
PKGNAME=	jrl-dynamics-${VERSION}
VERSION=	1.25.0

CATEGORIES=	math

MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-dynamics/}
MASTER_REPOSITORY=	git git@github.com:jrl-umi3218/jrl-dynamics.git

MAINTAINER=	hpp@laas.fr
COMMENT=	JRL-Japan implementation of dynamic robot.
LICENSE=	gnu-lgpl-v3

USE_BOOST_LIBS=		system

DYNAMIC_PLIST_DIRS+=	share/doc/jrl-dynamics

# Build the package in a separate directory
CONFIGURE_DIRS=		_build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/_build

include ../../interfaces/jrl-mal/depend.mk
include ../../interfaces/abstract-robot-dynamics/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/graphviz.mk
include ../../mk/sysdep/pdflatex.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
