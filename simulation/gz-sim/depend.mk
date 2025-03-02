# robotpkg depend.mk for:	simulation/gz-sim
# Created:			Anthony Mallet on Wed,  5 Mar 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GZ_SIM_DEPEND_MK:=	${GZ_SIM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gz-sim
endif

ifeq (+,$(GZ_SIM_DEPEND_MK)) # -----------------------------------------

GZ_DEPEND_USE+=		gz-sim
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-sim?=	gz-sim>=8
DEPEND_DIR.gz-sim?=	../../simulation/gz-sim

SYSTEM_SEARCH.gz-sim=\
  'include/gz/sim[0-9]*/gz/sim.hh'	\
  'lib/libgz-sim[0-9]*.so'		\
  $(call gz_system_search,gz-sim)

endif # GZ_SIM_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
