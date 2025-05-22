# robotpkg Makefile for:	hardware/realsense-genom3
# Created:			Anthony Mallet on Tue,  8 Apr 2025
#

DISTNAME=		realsense-genom3-2.0
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=${PKGBASE}/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS}${PKGBASE}

MAINTAINER=		openrobots@laas.fr
COMMENT=		GenoM3 component for Intel® RealSense™ depth cameras
LICENSE=		2-clause-bsd

include ../../architecture/genom3/module.mk

DEPEND_ABI.openrobots2-idl=	openrobots2-idl>=2.3.1

include ../../interfaces/camera-libgenom3/depend.mk
include ../../interfaces/openrobots2-idl/depend.mk
include ../../hardware/librealsense/depend.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
