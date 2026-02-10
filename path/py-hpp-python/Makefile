# robotpkg Makefile for:	path/py-hpp-python
# Created:			Guilhem Saurel on Thu, 19 Dec 2024
#

HPP_PACKAGE=		hpp-python
HPP_COMMENT=		Python bindings for Humanoid Path Planner

CATEGORIES=		path

MAKE_JOBS_SAFE=		no
PYTHON_NOTAG_CONFLICT=	yes

include ../../meta-pkgs/hpp/Makefile.common

# replace python interpreter
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	doc/configure.py

CONFIGURE_DIRS=		build
CMAKE_ARG_PATH=		..

pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build

include ../../doc/py-hpp-tutorial/depend.mk
include ../../math/hpp-pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-manipulation-urdf/depend.mk
include ../../path/hpp-manipulation/depend.mk
include ../../path/py-hpp-corbaserver/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c++.mk
include ../../mk/language/c.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
