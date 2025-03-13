# robotpkg sysdep/zeromq.mk
# Created:			Azamat Shakhimardanov on Thu, 7 Oct 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ZEROMQ_DEPEND_MK:=	${ZEROMQ_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		zeromq
endif

ifeq (+,$(ZEROMQ_DEPEND_MK)) # ---------------------------------------------

PREFER.zeromq?=		system

DEPEND_USE+=		zeromq

DEPEND_ABI.zeromq?=	zeromq>=1

SYSTEM_SEARCH.zeromq=\
  'include/zmq.h'	\
  'lib/libzmq.so'	\
  'lib/pkgconfig/libzmq.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.zeromq=	libczmq-dev
SYSTEM_PKG.NetBSD.cppzmq=	net/zeromq
SYSTEM_PKG.RedHat.cppzmq=	zeromq-devel

endif # ZEROMQ_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
