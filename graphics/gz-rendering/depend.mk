# robotpkg depend.mk for:	graphics/gz-rendering
# Created:			Anthony Mallet on Wed, 12 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_RENDERING_DEPEND_MK:=	${GZ_RENDERING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-rendering
endif

ifeq (+,$(GZ_RENDERING_DEPEND_MK)) # ---------------------------------------

GZ_DEPEND_USE+=			gz-rendering
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-rendering?=	gz-rendering>=8
DEPEND_DIR.gz-rendering?=	../../graphics/gz-rendering

SYSTEM_SEARCH.gz-rendering=\
  'include/gz/rendering[0-9]*/gz/rendering.hh'	\
  'lib/libgz-rendering[0-9]*.so'		\
  $(call gz_system_search,gz-rendering,)

endif # GZ_RENDERING_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
