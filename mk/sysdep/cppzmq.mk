# robotpkg sysdep/cppzmq.mk
# Created:			Anthony Mallet on Thu, 13 Feb 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CPPZMQ_DEPEND_MK:=	${CPPZMQ_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		cppzmq
endif

ifeq (+,$(CPPZMQ_DEPEND_MK)) # ---------------------------------------------

PREFER.cppzmq?=		system

DEPEND_USE+=		cppzmq

DEPEND_ABI.cppzmq?=	cppzmq

SYSTEM_SEARCH.cppzmq=\
  'include/zmq.hpp'				\
  'share/cmake/cppzmq/cppzmqConfig.cmake'	\
  'lib/pkgconfig/cppzmq.pc:/Version/s/[^0-9.]//gp'

endif # CPPZMQ_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
