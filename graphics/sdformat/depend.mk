# robotpkg depend.mk for:	graphics/sdformat
# Created:			Anthony Mallet on Fri, 7 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
SDFORMAT_DEPEND_MK:=		${SDFORMAT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			sdformat
endif

ifeq (+,$(SDFORMAT_DEPEND_MK)) # --------------------------------------------

GZ_DEPEND_USE+=			sdformat
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.sdformat?=		sdformat>=14
DEPEND_DIR.sdformat?=		../../graphics/sdformat

SYSTEM_SEARCH.sdformat=\
  'include/gz/sdformat[0-9]*/sdformat.hh'	\
  'lib/libsdformat[0-9]*.so'		\
  $(call gz_system_search,sdformat,)

# transitive dependencies
include ../../devel/gz-utils/depend.mk
include ../../math/gz-math/depend.mk
include ../../mk/sysdep/tinyxml2.mk

endif # SDFORMAT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
