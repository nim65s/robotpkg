# robotpkg Makefile for:	simulation/mrsim-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DISTNAME=		mrsim-gazebo-1.3
PKGNAME=		mrsim-gazebo-classic-1.3
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=mrsim-gazebo/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}mrsim-gazebo

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulator plugin for tk3-mikrokopter multi-rotors
LICENSE=		2-clause-bsd
CONFLICTS+=		mrsim-gazebo-[0-9]*

# Fedora version of tbb>=2021 is incompatible with gazebo-10 headers.
# This was fixed in gazebo-11.11.0.
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Fedora,${OPSYS})
  DEPEND_ABI.gazebo+= gazebo>=11.11
endif

GNU_CONFIGURE=		yes

include ../../pkgtools/pkg-config/depend.mk
include ../../simulation/libmrsim/depend.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/gazebo.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
