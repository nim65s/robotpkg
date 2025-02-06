# robotpkg depend.mk for:	sysutils/gz-tools
# Created:			Anthony Mallet on Thu,  6 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_TOOLS_DEPEND_MK:=		${GZ_TOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-tools
endif

ifeq (+,$(GZ_TOOLS_DEPEND_MK)) # -------------------------------------------

GZ_DEPEND_USE+=			gz-tools
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-tools?=		gz-tools>=2
DEPEND_DIR.gz-tools?=		../../sysutils/gz-tools

SYSTEM_SEARCH.gz-tools=		'bin/gz'

endif # GZ_TOOLS_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
