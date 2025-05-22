# robotpkg Makefile for:	simulation/mrsim-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DISTNAME=		mrsim-gazebo-2.0
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for tk3-paparazzi multi-rotors
LICENSE=		2-clause-bsd
CONFLICTS+=		mrsim-gazebo-classic-[0-9]*

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--with-gz-sim=$(call gz_pkgbase, gz-sim)

include ../../simulation/gz-sim/depend.mk
include ../../simulation/libmrsim/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
