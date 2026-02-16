# robotpkg depend.mk for:	optimization/fatrop
# Created:			Guilhem Saurel on Mon, 16 Jan 2026
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
FATROP_DEPEND_MK:=		${FATROP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			fatrop
endif

ifeq (+,$(FATROP_DEPEND_MK)) # ---------------------------------------

PREFER.fatrop?=			robotpkg

DEPEND_USE+=			fatrop

DEPEND_ABI.fatrop?=		fatrop>=1.0.0
DEPEND_DIR.fatrop?=		../../optimization/fatrop

SYSTEM_SEARCH.fatrop=		\
  'cmake/fatropConfig.cmake'	\
  'include/fatrop/fatrop.hpp'	\
  'lib/libfatrop.so'

endif # FATROP_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
