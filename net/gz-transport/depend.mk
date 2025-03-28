# robotpkg depend.mk for:	net/gz-transport
# Created:			Anthony Mallet on Fri, 7 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_TRANSPORT_DEPEND_MK:=	${GZ_TRANSPORT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-transport
endif

ifeq (+,$(GZ_TRANSPORT_DEPEND_MK)) # ---------------------------------------

GZ_DEPEND_USE+=			gz-transport
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-transport?=	gz-transport>=13
DEPEND_DIR.gz-transport?=	../../net/gz-transport

SYSTEM_SEARCH.gz-transport=\
  'include/gz/transport[0-9]*/gz/transport.hh'	\
  'lib/libgz-transport[0-9]*.so'		\
  $(call gz_system_search,gz-transport, log parameters)

# transitive dependencies
include ../../devel/gz-utils/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../mk/sysdep/libuuid.mk
include ../../mk/sysdep/protobuf.mk

endif # GZ_TRANSPORT_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
