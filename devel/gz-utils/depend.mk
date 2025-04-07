# robotpkg depend.mk for:	devel/gz-utils
# Created:			Anthony Mallet on Wed,  5 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_UTILS_DEPEND_MK:=		${GZ_UTILS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-utils
endif

ifeq (+,$(GZ_UTILS_DEPEND_MK)) # -------------------------------------------

GZ_DEPEND_USE+=			gz-utils
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-utils?=		gz-utils>=2
DEPEND_DIR.gz-utils?=		../../devel/gz-utils

SYSTEM_SEARCH.gz-utils=\
  'include/gz/utils[0-9]*/gz/utils.hh'	\
  'lib/libgz-utils[0-9]*.so'		\
  $(call gz_system_search,gz-utils, cli)

endif # GZ_UTILS_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
