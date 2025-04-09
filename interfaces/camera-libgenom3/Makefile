# robotpkg Makefile for:	intefaces/camera-libgenom3
# Created:			Anthony Mallet on Tue,  1 Apr 2025
#

PKGREVISION=		2
DISTNAME=		camera-libgenom3-1.0
CATEGORIES=		intefaces image
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Genom3 camera interface for image acquisition
LICENSE=		2-clause-bsd

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	MAKE=${MAKE}
CONFIGURE_ARGS+=	--with-opencv=${PKG_ALTERNATIVE.opencv:3=}

DEPEND_ABI.opencv+=		opencv>=3
DEPEND_ABI.openrobots2-idl+=	openrobots2-idl>=2.3.1

include ../../architecture/genom3/depend.mk
include ../../interfaces/openrobots2-idl/depend.mk
include ../../image/opencv/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
