# robotpkg Makefile for:	pkgtools/libnbcompat
# Created:			Anthony Mallet on Wed, 6 Jun 2007
#

PKREVISION=		1
DISTNAME=		libnbcompat-20251029
CATEGORIES=		pkgtools devel
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.NetBSD.org/
COMMENT=		Portable NetBSD compatibility library
LICENSE=		2-clause-bsd modified-bsd original-bsd

NO_CHECKSUM=		yes

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-bsd-getopt --enable-db

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-extract:
	@${CP} -Rp ${CURDIR}/dist ${WRKSRC}
