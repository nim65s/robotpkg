# robotpkg Makefile for:	hardware/gyroKVH1000
# Created:			Anthony Mallet on Tue, 17 Jun 2008
#

DISTNAME=		gyro-libs-${VERSION}
PKGNAME=		gyroKVH1000-${VERSION}
VERSION=		1.4
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Driver and interface for gyroKVH1000
LICENSE=		isc
CONFLICTS+=		gyroKVH5000-[0-9]*

GNU_CONFIGURE=		yes
CONFIGURE_DIRS=		gyroKVH1000

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../devel/mkdep/depend.mk
include ../../middleware/pocolibs/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
