# robotpkg Makefile for:	doc/hpp-doc
# Created:			Anthony Mallet on Tue, 19 Feb 2008
#

HPP_PACKAGE=		hpp-doc
HPP_COMMENT=		Documentation for project Humanoid Path Planner

CATEGORIES=	doc

include ../../meta-pkgs/hpp/Makefile.common

# Replace python interpreter in source files
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp=	scripts/packageDep

include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
