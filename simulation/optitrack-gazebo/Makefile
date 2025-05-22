# robotpkg Makefile for:	simulation/optitrack-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DISTNAME=		optitrack-gazebo-2.0
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for OptiTrack Motion Capture
LICENSE=		2-clause-bsd
CONFLICTS+=		optitrack-gazebo-classic-[0-9]*

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--with-gz-sim=$(call gz_pkgbase, gz-sim)

include ../../simulation/gz-sim/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
