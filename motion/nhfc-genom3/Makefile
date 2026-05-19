# robotpkg Makefile for:	motion/nhfc-genom3
# Created:			Anthony Mallet on Tue, 10 Nov 2015
#

DISTNAME=		nhfc-genom3-2.5
CATEGORIES=		motion
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}telekyb3/${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Near-hovering flight controller for rotorcrafts
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

DEPEND_ABI.proxsuite+=  proxsuite>=0.6.4

include ../../interfaces/openrobots2-idl/depend.mk
include ../../math/eigen3/depend.mk
include ../../optimization/proxsuite/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
