# robotpkg Makefile for:	mapping/worldmodelgrid3d
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DISTNAME=	worldmodelgrid3d-1.0
CATEGORIES=	mapping
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=worldModelGrid3D/}

MAINTAINER=	openrobots@laas.fr
#HOMEPAGE=	ftp://softs.laas.fr/pub/openrobots/worldModelGrid3D/
COMMENT=	Probabilistic, 3D occupancy grid building

GNU_CONFIGURE=	yes

DYNAMIC_PLIST_DIRS+=	share/doc/worldModelGrid3D


# 3D image options
PKG_SUPPORTED_OPTIONS+=	boost
PKG_SUGGESTED_OPTIONS+=	boost

PKG_OPTION_DESCR.boost=Use boost 3D image structure
define PKG_OPTION_SET.boost
  CONFIGURE_ARGS+=--with-images=boost
  CONFIGURE_ARGS+=--with-boost=${PREFIX.boost-headers}
  include ../../mk/sysdep/boost-headers.mk
endef

define PKG_OPTION_UNSET.boost
  CONFIGURE_ARGS+=--with-images=libimages3d
  include ../../image/libimages3d/depend.mk
endef

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
