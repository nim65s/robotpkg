# robotpkg Makefile for:	simulation/dxsim-gazebo
# Created:			Anthony Mallet on Thu, 20 Jul 2023
#

DISTNAME=		dxsim-gazebo-2.1
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for Dynamixel motors
LICENSE=		2-clause-bsd
CONFLICTS+=		dxsim-gazebo-classic-[0-9]*

GNU_CONFIGURE=		yes

CONFIGURE_ARGS+=	--with-gz-sim=$(call gz_pkgbase, gz-sim)

DEPEND_ABI.libdynamixel+=libdynamixel>=1.3

include ../../simulation/gz-sim/depend.mk
include ../../simulation/libdynamixel/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
