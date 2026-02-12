# robotpkg Makefile for:	optimization/py-casadi
# Created:			Guilhem Saurel on Wed, 7 Aug 2019
#

PKGNAME=		${PKGTAG.python-}${DISTNAME}

include ../../optimization/casadi/Makefile.common

CMAKE_ARGS+=		-DPYTHON_PREFIX=${PREFIX}/${PYTHON_SITELIB}
CMAKE_ARGS+=		-DSWIG_EXECUTABLE=${SWIG}
CMAKE_ARGS+=		-DWITH_PYTHON=ON
CMAKE_ARGS+=		-DWITH_PYTHON3=$(if $(filter 3,${PYTHON_MAJOR}),ON,OFF)

PLIST_SUBST+=		PYTHON_MAJOR3=$(subst 2,,${PYTHON_MAJOR})

DEPEND_ABI.casadi=	casadi-${PKGVERSION_NOREV}
DEPEND_ABI.swig=	swig>=3

include ../../optimization/casadi/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/swig.mk
include ../../mk/robotpkg.mk
