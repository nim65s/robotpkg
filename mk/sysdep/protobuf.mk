# robotpkg sysdep/protobuf.mk
# Created:			Anthony Mallet on Mon 19 Nov 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PROTOBUF_DEPEND_MK:=	${PROTOBUF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		protobuf
endif

ifeq (+,$(PROTOBUF_DEPEND_MK)) # -------------------------------------------

PREFER.protobuf?=	system
DEPEND_USE+=		protobuf
DEPEND_ABI.protobuf?=	protobuf>=2.3.0

SYSTEM_SEARCH.protobuf=	\
  'bin/protoc:1s/[^0-9.]//gp:% --version:'	\
  'include/google/protobuf/api.proto'		\
  'lib/libprotobuf.so'				\
  'lib/pkgconfig/protobuf.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.protobuf=	libprotoc-dev
SYSTEM_PKG.NetBSD.protobuf=	devel/protobuf

endif # PROTOBUF_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
