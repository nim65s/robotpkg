# robotpkg sysdep/openssl.mk
# Created:			Anthony Mallet on Fri Nov 20 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENSSL_DEV_DEPEND_MK:=	${OPENSSL_DEV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openssl-dev
endif

ifeq (+,$(OPENSSL_DEV_DEPEND_MK)) # --------------------------------------------

PREFER.openssl-dev?=	system
DEPEND_USE+=		openssl-dev
DEPEND_ABI.openssl-dev?=	openssl-dev>=0.9.6

SYSTEM_PKG.Fedora.openssl-dev=	openssl openssl-devel
SYSTEM_PKG.Ubuntu.openssl-dev=	libssl-dev
SYSTEM_PKG.Debian.openssl-dev=	libssl-dev
SYSTEM_PKG.NetBSD.openssl-dev=	pkgsrc/security/openssl

SYSTEM_SEARCH.openssl-dev:=	\
  'include/openssl/opensslv.h:/VERSION_TEXT/{${_vregex.openssl};q;}'

endif # OPENSSL_DEV_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
