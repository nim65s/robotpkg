# robotpkg Makefile for:	middleware/pocolibs
# Created:			Anthony Mallet on Sun, 28 Jan 2007
#

DISTNAME=		pocolibs-3.2
CATEGORIES=		middleware
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pocolibs/}
MASTER_REPOSITORY=	git git://git.openrobots.org/robots/pocolibs.git

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		https://git.openrobots.org/projects/pocolibs
COMMENT=		Real-time communication library used by GenoM modules.

LICENSE=		isc
NOT_FOR_PLATFORM=	# empty
GNU_CONFIGURE=		yes

# Enable valgrind support
PKG_SUPPORTED_OPTIONS+=	valgrind
PKG_OPTION_DESCR.valgrind:=	Enable valgrind support

define PKG_OPTION_SET.valgrind
  CONFIGURE_ARGS+=	--enable-valgrind
  include ../../mk/sysdep/valgrind.mk
endef

# Xenomai option
PKG_SUPPORTED_OPTIONS+=	xenomai
PKG_OPTION_DESCR.xenomai:=	Enable Xenomai support

define PKG_OPTION_SET.xenomai
  CONFIGURE_ARGS+=	--with-xenomai
  include ../../mk/sysdep/xenomai.mk
endef

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/perl.mk
include ../../mk/sysdep/rpcgen.mk
include ../../mk/language/c.mk
include ../../mk/language/rpc.mk
include ../../mk/robotpkg.mk
