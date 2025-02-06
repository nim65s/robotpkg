# robotpkg depend.mk for:	devel/gz-cmake
# Created:			Anthony Mallet on Wed,  5 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_CMAKE_DEPEND_MK:=		${GZ_CMAKE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-cmake
endif

ifeq (+,$(GZ_CMAKE_DEPEND_MK)) # -------------------------------------------

GZ_DEPEND_USE+=			gz-cmake
include ../../simulation/gz-sim/depend.common

DEPEND_METHOD.gz-cmake?=	build
DEPEND_ABI.gz-cmake?=		gz-cmake>=3
DEPEND_DIR.gz-cmake?=		../../devel/gz-cmake

SYSTEM_SEARCH.gz-cmake=\
  'include/gz/cmake[0-9]*/gz/utilities/ExtraTestMacros.hh'	\
  'lib/pkgconfig/gz-cmake[0-9]*.pc:/Version/s/[^.0-9]//gp'	\
  'share/cmake/gz-cmake[0-9]*/gz-cmake[0-9]*-config.cmake'

endif # GZ_CMAKE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
