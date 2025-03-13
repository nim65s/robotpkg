# robotpkg sysdep/openssl.mk
# Created:			Anthony Mallet on Fri Nov 20 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENSSL_BIN_DEPEND_MK:=	${OPENSSL_BIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openssl-bin
endif

ifeq (+,$(OPENSSL_BIN_DEPEND_MK)) # --------------------------------------------

PREFER.openssl-bin?=	system
DEPEND_USE+=		openssl-bin
DEPEND_ABI.openssl-bin?=	openssl-bin>=0.9.6

SYSTEM_PKG.Fedora.openssl-bin=	openssl openssl-devel
SYSTEM_PKG.Ubuntu.openssl-bin=	libssl-dev
SYSTEM_PKG.Debian.openssl-bin=	libssl-dev
SYSTEM_PKG.NetBSD.openssl-bin=	pkgsrc/security/openssl

_vregex.openssl-bin:=s/^.*OpenSSL[ ]*//;s/[ -].*$$//;p
SYSTEM_SEARCH.openssl-bin:=	\
  'bin/openssl:/OpenSSL/{${_vregex.openssl-bin};}:% version'

endif # OPENSSL_BIN_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
