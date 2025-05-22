# robotpkg Makefile for:	simulation/optitrack-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DISTNAME=		optitrack-gazebo-1.0
PKGNAME=		optitrack-gazebo-classic-1.0
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=optitrack-gazebo/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}optitrack-gazebo

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for OptiTrack Motion Capture
LICENSE=		2-clause-bsd
CONFLICTS+=		optitrack-gazebo-[0-9]*

# Fedora version of tbb>=2021 is incompatible with gazebo-10 headers.
# This was fixed in gazebo-11.11.0.
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Fedora,${OPSYS})
  DEPEND_ABI.gazebo+= gazebo>=11.11
endif

GNU_CONFIGURE=		yes

include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/gazebo.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
