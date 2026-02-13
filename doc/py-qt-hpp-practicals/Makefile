# robotpkg Makefile for:	doc/py-hpp-practicals
# Created:			Florent Lamiraux on Wed, 29 May 2019
#

PKGREVISION=		1
HPP_PACKAGE=		hpp-practicals
HPP_COMMENT=		Practicals for hpp software

PKGNAME=		${PKGTAG.python-}${PKGTAG.qt-}${DISTNAME}

CATEGORIES=		doc

PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

# override doc option to fix doc installation dir
define PKG_OPTION_SET.doc
  BUILD_TARGET+=		doc
  CMAKE_ARGS+=			-DINSTALL_DOCUMENTATION=TRUE
  DYNAMIC_PLIST_DIRS+=		share/doc/$(subst -,_,${HPP_PACKAGE})

  include ../../mk/sysdep/doxygen.mk
  include ../../mk/sysdep/latex.mk
endef

include ../../graphics/py-qt-hpp-gepetto-viewer/depend.mk
include ../../graphics/py-qt-hpp-gui/depend.mk
include ../../graphics/py-qt-hpp-plot/depend.mk
include ../../path/py-hpp-manipulation-corba/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
