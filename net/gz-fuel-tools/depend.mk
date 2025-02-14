# robotpkg depend.mk for:	net/gz-fuel-tools
# Created:			Anthony Mallet on Thu, 27 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_FUEL_TOOLS_DEPEND_MK:=	${GZ_FUEL_TOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-fuel-tools
endif

ifeq (+,$(GZ_FUEL_TOOLS_DEPEND_MK)) # --------------------------------------

GZ_DEPEND_USE+=			gz-fuel-tools
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-fuel-tools?=	gz-fuel-tools>=9
DEPEND_DIR.gz-fuel-tools?=	../../net/gz-fuel-tools

SYSTEM_SEARCH.gz-fuel-tools=\
  'include/gz/fuel_tools[0-9]*/gz/fuel_tools.hh'	\
  'lib/libgz-fuel_tools[0-9]*.so'			\
  $(call gz_system_search,gz-fuel_tools,)

endif # GZ_FUEL_TOOLS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
