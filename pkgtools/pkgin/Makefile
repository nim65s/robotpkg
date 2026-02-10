# robotpkg Makefile for:	pkgtools/pkgin
# Created:			Anthony Mallet on Mon, 5 Aug 2013
#

DISTNAME=		pkgin-26.2.0
CATEGORIES=		pkgtools
MASTER_SITES=		${MASTER_SITE_GITHUB:=NetBSDfr/}
GITHUB_TAG=		v${PKGVERSION_NOREV}

MAINTAINER=		mallet@laas.fr
HOMEPAGE=		https://pkgin.net/
COMMENT=		Apt / yum like tool for managing pkgsrc binary packages
LICENSE=		modified-bsd

CONF_DIR=		${PKG_SYSCONFDIR}/robot${PKGBASE}
INSTALLATION_DIRS+=	bin ${PKGMANDIR}/man1 ${CONF_DIR}

SUBST_CLASSES+=		path
SUBST_STAGE.path=	pre-configure
SUBST_MESSAGE.path=	Adjusting paths
SUBST_FILES.path=	pkgin.1
SUBST_SED.path=		-e "s|/usr/pkg/etc|${PKG_SYSCONFDIR}|g"
SUBST_SED.path+=	-e "s|pkgin|robotpkgin|g" -e "s|PKGIN|ROBOTPKGIN|g"
SUBST_SED.path+=	-e "s|pkg_|robotpkg_|g"

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--disable-maintainer-mode
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-dbdir=${PREFIX}/var/db/robotpkgin
CONFIGURE_ARGS+=	--with-machine-arch=${MACHINE_ARCH}
CONFIGURE_ARGS+=	--with-pkg-install=$(PREFIX.pkg_install)
CONFIGURE_ARGS+=	--with-libarchive=${PREFIX.libarchive}
CONFIGURE_ARGS+=	--with-libfetch=${PREFIX.libfetch}
CONFIGURE_ARGS+=	--with-sqlite3=${PREFIX.libsqlite3}

LIBNBCOMPAT_STYLE=	inplace
CPPFLAGS+=		-DHAVE_NBCOMPAT_H=1

include ../../archivers/libarchive/depend.mk
include ../../net/libfetch/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../pkgtools/libnbcompat/depend.mk
include ../../mk/sysdep/libsqlite3.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

# These files are included in pkgin source. However, our pkg_install is patched
# to handle ~options suffix, so get the locally patched source instead of the
# bundled versions.
PKG_INSTALL_SRC=	defs.h opattern.c dewey.c xwrapper.c

post-extract:
	${RUN}for f in ${PKG_INSTALL_SRC}; do				\
	  ${CP} ${ROBOTPKG_DIR}/pkgtools/pkg_install/dist/lib/$$f	\
	   ${WRKSRC}/external/.;					\
	done;								\
									\
	{ echo 'static const char robotpkg_opsys[] =';			\
	  ${SED} -e /^#/d -e 's/"/\\"/g' -e 's/^/"/' -e 's/$$/\\n"/'	\
	    <${ROBOTPKG_DIR}/mk/platform/opsys.sh;			\
	  echo ';'; }  >${WRKSRC}/opsys.h;

do-install:
	${RUN}								\
	${INSTALL_PROGRAM} ${WRKSRC}/pkgin				\
		${DESTDIR}${PREFIX}/bin/robotpkgin;			\
	${INSTALL_MAN} ${WRKSRC}/pkgin.1				\
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1/robotpkgin.1;	\
	${INSTALL_DATA} ${WRKSRC}/repositories.conf			\
		${DESTDIR}${CONF_DIR}/
