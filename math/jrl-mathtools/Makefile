# robotpkg Makefile for:	math/jrl-mathtools
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

PKGREVISION=		3
DISTNAME=		jrl-mathtools-1.5.2
CATEGORIES=		math
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=jrl-mathtools/}
MASTER_REPOSITORY=	git http://github.com/jrl-umi3218/jrl-mathtools.git

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	https://github.com/jrl-umi3218/jrl-mathtools
COMMENT=	Basic mathematical tools used in the JRL software
LICENSE=	gnu-lgpl-v3

DYNAMIC_PLIST_DIRS+=	share/doc/jrl-mathtools

DEPEND_ABI.boost-headers=	boost-headers>=1.40
DEPEND_ABI.boost-libs=		boost-libs>=1.40

CMAKE_ARGS+=	-DCXX_DISABLE_WERROR=TRUE

# configure the path to blas/lapack libraries. cmake Find{BLAS,LAPACK}
# have no other mean to configure a specific path.
CMAKE_ARGS+=\
  '-DBLAS_LIBRARIES=${BLAS_LIB}'			\
  '-DLAPACK_LIBRARIES=${LAPACK_LIB};${BLAS_LIB}'

USE_BOOST_LIBS= filesystem system thread program_options unit_test_framework

include ../../math/lapack/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/language/fortran.mk
include ../../mk/robotpkg.mk
