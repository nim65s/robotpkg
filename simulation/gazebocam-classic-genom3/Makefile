# robotpkg Makefile for:	simulation/gazebocam-classic-genom3
# Created:			Anthony Mallet on Wed, 24 Sep 2025
#

DISTNAME=		gazebocam-genom3-2.0
PKGNAME=		gazebocam-classic-genom3-2.0
CATEGORIES=		simulation
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=gazebocam-genom3/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}/gazebocam-genom3

MAINTAINER=		openrobots@laas.fr
COMMENT=		Gazebo simulation camera sensor publisher
LICENSE=		2-clause-bsd

GENOM_MODULE=		gazebocam
include ../../architecture/genom3/module.mk

# Fedora version of tbb>=2021 is incompatible with gazebo-10 headers.
# This was fixed in gazebo-11.11.0.
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Fedora,${OPSYS})
  DEPEND_ABI.gazebo+= gazebo>=11.11
endif

include ../../interfaces/openrobots2-idl/depend.mk
include ../../mk/sysdep/gazebo.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
