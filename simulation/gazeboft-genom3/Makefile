# robotpkg Makefile for:	simulation/gazeboft-genom3
# Created:			Anthony Mallet on Mon, 31 Mar 2025
#

DISTNAME=		gazeboft-genom3-2.0
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulation force/torque sensor publisher
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

CONFIGURE_ARGS..+=	--with-gz-transport=$(call gz_pkgbase, gz-transport)

include ../../interfaces/openrobots2-idl/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../net/gz-transport/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
