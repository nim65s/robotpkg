# robotpkg Makefile for:	motion/py-dynamic-graph
# Created:			Florent Lamiraux on Thu, 7 Jul 2011
#

PKGREVISION=		2
VERSION=		2.5.6
DISTNAME=		dynamic-graph-python-${VERSION}
PKGNAME=		${PKGTAG.python-}dynamic-graph-${VERSION}
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dynamic-graph-python/}
MASTER_REPOSITORY=\
	${MASTER_REPOSITORY_GITHUB}/jrl-umi3218/dynamic-graph-python

MAINTAINER=	gepetto@laas.fr
CATEGORIES=	motion
LICENSE=	gnu-lgpl-v3
COMMENT=	Python bindings for motion/dynamic-graph package

CONFLICTS+=		py-dynamic-graph-[0-9]*
CONFLICTS+=		py[0-9][0-9]-dynamic-graph-[0-9]*
DYNAMIC_PLIST_DIRS+=	share/doc/dynamic-graph-python

CMAKE_ARGS+=		-DPYTHON_EXECUTABLE=${PYTHON}
CMAKE_ARGS+=		-DPYTHON_INCLUDE_DIR=${PYTHON_INCLUDE}
CMAKE_ARGS+=		-DPYTHON_LIBRARY=${PYTHON_LIB}
CMAKE_ARGS+=		-DPYTHON_SITELIB=${PYTHON_SITELIB}
CMAKE_ARGS+=		-DSPHINX_BUILD=${SPHINX_BUILD}

CMAKE_ARGS+=		-DCMAKE_INSTALL_LIBDIR=lib

# disable -Werror, some warnings from boost-filesystem (1.50, netbsd) cannot be
# fixed here
CMAKE_ARGS+=		-DCXX_DISABLE_WERROR=yes

DEPEND_ABI.python+=	python<3

USE_BOOST_LIBS=\
  python filesystem system thread program_options unit_test_framework

Boost_PYTHON_LIBRARY=	$(filter %.so,${SYSTEM_FILES.boost-lib-python})
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_RELEASE=${Boost_PYTHON_LIBRARY}
CMAKE_ARGS+=		-DBoost_PYTHON_LIBRARY_DEBUG=${Boost_PYTHON_LIBRARY}

include ../../motion/dynamic-graph/depend.mk
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
