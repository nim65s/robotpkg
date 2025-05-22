# robotpkg Makefile for:	math/eigen3
# Created:			Nizar Sallem on Thu, 5 May 2011
#

VERSION=	3.4.0
DISTNAME=	eigen-${VERSION}
PKGNAME=	eigen3-${VERSION}
MASTER_SITES=	https://gitlab.com/libeigen/eigen/-/archive/${VERSION}/

CATEGORIES=	math
MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://eigen.tuxfamily.org/
COMMENT=	a C++ template library for linear algebra
LICENSE=	gnu-lgpl-v3

CONFIGURE_DIRS=	build
CMAKE_ARG_PATH=	..

CMAKE_ARGS+=	-DBUILD_TESTING=OFF
CMAKE_ARGS+=	-DEIGEN_BUILD_PKGCONFIG=ON
CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  BUILD_TARGET+=	doc
  post-install:		eigen3-install-doc

  INSTALLATION_DIRS+=	share/doc/${PKGBASE}
  DYNAMIC_PLIST_DIRS+=	share/doc/${PKGBASE}
  include ../../mk/sysdep/doxygen.mk
endef
define PKG_OPTION_UNSET.doc
  NO_BUILD=		yes
endef

include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# create the build directory
pre-configure:
	${RUN}${MKDIR} ${WRKSRC}/build

# install doxygen documentation
.PHONY: eigen3-install-doc
eigen3-install-doc:
	${RUN}cd ${WRKSRC}/build/doc && \
	${PAX} 2>&1 -r -w -v -pm html ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}
