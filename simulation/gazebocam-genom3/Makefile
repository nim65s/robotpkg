# robotpkg Makefile for:	simulation/gazebocam-genom3
# Created:			Anthony Mallet on Wed, 24 Sep 2025
#

DISTNAME=		gazebocam-genom3-3.0
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulation camera sensor publisher
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

CONFIGURE_ARGS+=	--with-gz-transport=$(call gz_pkgbase, gz-transport)

include ../../interfaces/openrobots2-idl/depend.mk
include ../../net/gz-transport/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
