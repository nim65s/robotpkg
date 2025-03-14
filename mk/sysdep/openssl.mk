# robotpkg sysdep/openssl.mk
# Created:			Anthony Mallet on Fri Nov 20 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENSSL_DEPEND_MK:=	${OPENSSL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openssl
endif

ifeq (+,$(OPENSSL_DEPEND_MK)) # --------------------------------------------

include ../../mk/sysdep/openssl-bin.mk
include ../../mk/sysdep/openssl-dev.mk
include ../../mk/sysdep/openssl-lib.mk

endif # OPENSSL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
