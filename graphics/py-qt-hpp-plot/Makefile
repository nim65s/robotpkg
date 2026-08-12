# robotpkg Makefile for:	graphics/py-qt-hpp-plot
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-plot
HPP_COMMENT=		Plotting tools for hpp

PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}
DISTFILES=		${GITHUB_DISTFILE} ${WEBAPP_DISTFILE}
EXTRACT_ONLY=		${GITHUB_DISTFILE}

CATEGORIES=		graphics

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

WEBAPP_DISTFILE=	webapp-${PKGVERSION_NOREV}.tar.gz
WEBAPP_URL=		releases/download/${GITHUB_TAG}/webapp.tar.gz
SITES.${WEBAPP_DISTFILE}=\
  ${MASTER_SITES:=${GITHUB_PROJECT}/${WEBAPP_URL}?robotpkg=}
WEBAPP_INSTALL_DIR=	share/hpp-plot/webapp

INSTALLATION_DIRS+=	${WEBAPP_INSTALL_DIR}

CMAKE_ARGS+=		-DUSE_CORBA=ON
CMAKE_ARGS+=		-DUSE_JS=OFF # robotpkg not ready for npm yet
CMAKE_ARGS+=		-DUSE_QT=ON

DEPEND_ABI.qt+=		qt>=5

include ../../graphics/py-qt-gepetto-viewer-corba/depend.mk
include ../../graphics/qt-qgv/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/py-hpp-manipulation-corba/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

post-install:
	${RUN}cd ${PREFIX} && cd ${WEBAPP_INSTALL_DIR} && \
	  ${CMAKE} -E tar xvz ${DISTDIR}/${WEBAPP_DISTFILE}
