# robotpkg Makefile for:	graphics/py-pythonqt
# Created:			Guilhem Saurel on Wed, 27 May 2020
#

DISTNAME=		pythonqt-3.6.0
PKGNAME=		${PKGTAG.python-}${DISTNAME}
MASTER_SITES=		${MASTER_SITE_GITHUB:=MeVisLab/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

CATEGORIES=		graphics
COMMENT=		Dynamic Python binding for Qt Applications
LICENSE=		gnu-lgpl-v2.1
MAINTAINER=		guilhem.saurel@laas.fr

QMAKE_ARGS+=		CONFIG+=release
QMAKE_ARGS+=		CONFIG+=no_moc_predefs
QMAKE_ARGS+=		PYTHON_VERSION=${PYTHON_VERSION}
QMAKE_ARGS+=		PYTHON_DIR=${PREFIX.${PKG_ALTERNATIVE.python}}

# extensions must match dependencies
#
# XXX there is no qtwebkit implementation for Qt>=5.11 ?
# https://github.com/MeVisLab/pythonqt/issues/100
PYTHONQTALL_CONFIG=\
	PythonQtCore		\
	PythonQtGui		\
	PythonQtSvg		\
	PythonQtXml		\
	PythonQtXmlpatterns	\
	PythonQtMultimedia
QMAKE_ARGS+=		PYTHONQTALL_CONFIG='${PYTHONQTALL_CONFIG}'

PYTHON_SELF_CONFLICT=	yes

INSTALLATION_DIRS+=	lib
INSTALLATION_DIRS+=	include/PythonQt/gui
INSTALLATION_DIRS+=	include/PythonQt/extensions/PythonQt_QtAll

include ../../pkgtools/install-sh/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/qt5-multimedia.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/sysdep/qt5-qtbase-private.mk
include ../../mk/sysdep/qt5-svg.mk
include ../../mk/sysdep/qt5-tools.mk
include ../../mk/sysdep/qt5-xmlpatterns.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk

# QByteArrayList
DEPEND_ABI.qt5-qtbase+=	qt5-qtbase>=5.4

include ../../mk/robotpkg.mk

# bundled installation rules are too exotic, use ours
do-install:
	${RUN}cd ${WRKSRC};						\
	${INSTALL_LIB} lib/*.so*					\
	  ${DESTDIR}${PREFIX}/lib/;					\
	${INSTALL_DATA} src/*.h						\
	  ${DESTDIR}${PREFIX}/include/PythonQt/;			\
	${INSTALL_DATA} src/gui/*.h					\
	  ${DESTDIR}${PREFIX}/include/PythonQt/gui/;			\
	${INSTALL_DATA} extensions/PythonQt_QtAll/*.h			\
	  ${DESTDIR}${PREFIX}/include/PythonQt/extensions/PythonQt_QtAll/
