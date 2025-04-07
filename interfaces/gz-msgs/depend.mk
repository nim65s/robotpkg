# robotpkg depend.mk for:	interfaces/gz-msgs
# Created:			Anthony Mallet on Fri,  7 Feb 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GZ_MSGS_DEPEND_MK:=	${GZ_MSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gz-msgs
endif

ifeq (+,$(GZ_MSGS_DEPEND_MK)) # --------------------------------------------

GZ_DEPEND_USE+=		gz-msgs
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-msgs?=	gz-msgs>=10
DEPEND_DIR.gz-msgs?=	../../interfaces/gz-msgs

SYSTEM_SEARCH.gz-msgs=\
  'include/gz/msgs[0-9]*/gz/msgs.hh'					\
  'lib/libgz-msgs[0-9]*.so'						\
  '{${PYTHON_SYSLIBSEARCH},lib/python}/gz/msgs[0-9]*/__init__.py'	\
  $(call gz_system_search, gz-msgs,)

# transitive dependencies
include ../../devel/gz-utils/depend.mk
include ../../math/gz-math/depend.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/sysdep/python.mk
include ../../mk/sysdep/tinyxml2.mk

endif # GZ_MSGS_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
