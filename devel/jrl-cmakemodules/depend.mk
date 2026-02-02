# robotpkg depend.mk for:	devel/jrl-cmakemodules
# Created:			Guilhem Saurelon Mon,  27 Oct 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
JRL_CMAKEMODULES_DEPEND_MK:=	${JRL_CMAKEMODULES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			jrl-cmakemodules
endif

ifeq (+,$(JRL_CMAKEMODULES_DEPEND_MK)) # -----------------------------------------

PREFER.jrl-cmakemodules?=	robotpkg

SYSTEM_SEARCH.jrl-cmakemodules=										\
  'include/jrl/cmakemodules/config.hh:/JRL_CMAKEMODULES_VERSION /s/[^0-9.]//gp'				\
  '{lib,share}/cmake/jrl-cmakemodules/jrl-cmakemodulesConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'

DEPEND_USE+=			jrl-cmakemodules
DEPEND_ABI.jrl-cmakemodules=	jrl-cmakemodules>=1.1.0
DEPEND_DIR.jrl-cmakemodules?=	../../devel/jrl-cmakemodules

endif # JRL_CMAKEMODULES_DEPEND_MK -----------------------------------------------

include			../../devel/jrl-cmakemodules/Makefile.common

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
