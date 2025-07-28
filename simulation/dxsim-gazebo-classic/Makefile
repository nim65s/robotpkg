# robotpkg Makefile for:	simulation/dxsim-gazebo-classic
# Created:			Anthony Mallet on Thu, 20 Jul 2023
#

DISTNAME=		dxsim-gazebo-1.3
PKGNAME=		dxsim-gazebo-classic-1.3
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=dxsim-gazebo/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}dxsim-gazebo

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for Dynamixel motors
LICENSE=		2-clause-bsd
CONFLICTS+=		dxsim-gazebo-[0-9]*

# Fedora version of tbb>=2021 is incompatible with gazebo-10 headers.
# This was fixed in gazebo-11.11.0.
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Fedora,${OPSYS})
  DEPEND_ABI.gazebo+= gazebo>=11.11
endif

GNU_CONFIGURE=		yes

DEPEND_ABI.libdynamixel+=libdynamixel>=1.3

include ../../simulation/libdynamixel/depend.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/gazebo.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
