# robotpkg Makefile for:	sysutils/tth
# Created:			Anthony Mallet on Tue, 13 Jan 2009
#

VERSION=		4.16
DISTNAME=		tthC
PKGNAME=		tth-${VERSION}
CATEGORIES=		sysutils
MASTER_SITES=		http://silas.psfc.mit.edu/tth/tars/
EXTRACT_SUFX=		.tgz
DIST_SUBDIR=		tth-${VERSION}

COMMENT=		TeX to HTML translator
HOMEPAGE=		http://silas.psfc.mit.edu/tth/
LICENSE=		gnu-gpl-v2
MAINTAINER=		openrobots@laas.fr

WRKSRC=			${WRKDIR}/tthgold
DOCDIR=			${PREFIX}/share/doc/tth
INSTALLATION_DIRS=	bin ${PKGMANDIR}/man1 ${DOCDIR}

include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

do-build:
	${RUN}cd ${WRKSRC} && \
	${CC} ${CPPFLAGS} ${CFLAGS} -o tth tth.c ${LDFLAGS}

do-install:
	${RUN}cd ${WRKSRC};					\
	${INSTALL_PROGRAM} tth ${PREFIX}/bin;			\
	${INSTALL_PROGRAM} latex2gif ${PREFIX}/bin;		\
	${INSTALL_DATA} tth.1 ${PREFIX}/${PKGMANDIR}/man1;	\
	${INSTALL_DATA} tth_man.html ${DOCDIR};			\
	${INSTALL_DATA} tth.gif ${DOCDIR}
