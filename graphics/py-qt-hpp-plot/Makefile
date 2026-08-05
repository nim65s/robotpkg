# robotpkg Makefile for:	graphics/py-qt-hpp-plot
# Created:			Guilhem Saurel on Tue, 26 Feb 2019
#

HPP_PACKAGE=		hpp-plot
HPP_COMMENT=		Plotting tools for hpp

PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		graphics

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

DEPEND_ABI.qt+=		qt>=5

CMAKE_ARGS+=		-DUSE_CORBA=ON
CMAKE_ARGS+=		-DUSE_JS=OFF
CMAKE_ARGS+=		-DUSE_QT=ON

include ../../graphics/py-qt-gepetto-viewer-corba/depend.mk
include ../../graphics/qt-qgv/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/py-hpp-manipulation-corba/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
