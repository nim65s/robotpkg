# robotpkg Makefile for:	hardware/libftdi
# Created:			Matthieu Herrb on Mon, 22 Dec 2008
#

DISTNAME=	libftdi-${PKGVERSION_NOREV}
PKGVERSION=	0.19
CATEGORIES=	hardware
MASTER_SITES=	http://www.intra2net.com/de/produkte/opensource/ftdi/TGZ/

HOMEPAGE=	http://www.intra2net.com/de/produkte/opensource/ftdi/
MAINTAINER=	openrobots@laas.fr
COMMENT=	interface to ftdi USB device devices

LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--without-python-binding
CONFIGURE_ARGS+=HAVELIBUSB=${PREFIX.libusb}/bin/libusb-config

INSTALLATION_DIRS+=	man/man3 share/doc/${PKGBASE}

# C++ wrappers option
PKG_SUPPORTED_OPTIONS+=	cxx
PKG_OPTION_DESCR.cxx?=	Build C++ wrappers

define PKG_OPTION_SET.cxx
  CONFIGURE_ARGS+=	--with-boost=${PREFIX.boost-libs}
  include ../../mk/sysdep/boost-libs.mk
endef
define PKG_OPTION_UNSET.cxx
  CONFIGURE_ARGS+=	--with-boost=no
endef

# doc option
PKG_SUPPORTED_OPTIONS+=	doc
PKG_SUGGESTED_OPTIONS+=	doc
PKG_OPTION_DESCR.doc?=	Install ${PKGBASE} documentation

define PKG_OPTION_SET.doc
  DYNAMIC_PLIST_DIRS+=	share/doc/${PKGBASE}
  include ../../mk/sysdep/doxygen.mk

  post-install: install-doc
endef


include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../archivers/pax/depend.mk
include ../../mk/sysdep/libusb.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk

.PHONY: install-doc
install-doc:
	${RUN} cd ${WRKSRC}/doc/man/man3 && \
	  ${PAX} -r -w -p ma -s @^./[^Fflu].*@@ . ${PREFIX}/man/man3
	${RUN} cd ${WRKSRC}/doc/html && \
	  ${PAX} -r -w -p ma . ${PREFIX}/share/doc/${PKGBASE}
