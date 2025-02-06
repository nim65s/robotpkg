# robotpkg depend.mk for:	devel/gz-math
# Created:			Anthony Mallet on Thu,  6 Feb 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GZ_MATH_DEPEND_MK:=	${GZ_MATH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gz-math
endif

ifeq (+,$(GZ_MATH_DEPEND_MK)) # --------------------------------------------

GZ_DEPEND_USE+=		gz-math
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-math?=	gz-math>=7
DEPEND_DIR.gz-math?=	../../math/gz-math

SYSTEM_SEARCH.gz-math=\
  'include/gz/math[0-9]*/gz/math.hh'	\
  'lib/libgz-math[0-9]*.so'		\
  $(call gz_system_search,gz-math, eigen3)

endif # GZ_MATH_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
