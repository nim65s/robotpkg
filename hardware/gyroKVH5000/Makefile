# robotpkg Makefile for:	hardware/gyroKVH5000
# Created:			Arnaud Degroote on Mon, 14 Jul 2008
#

DISTNAME=		gyro-libs-${VERSION}
PKGNAME=		gyroKVH5000-${VERSION}
VERSION=		1.4
CATEGORIES=		hardware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
COMMENT=		Driver and interface for gyroKVH5000
LICENSE=		isc
CONFLICTS+=		gyroKVH1000-[0-9]*

GNU_CONFIGURE=		yes
CONFIGURE_DIRS=		gyroKVH5000

include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../devel/mkdep/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
