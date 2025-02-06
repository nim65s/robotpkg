# robotpkg depend.mk for:	devel/gz-plugin
# Created:			Anthony Mallet on Thu,  6 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_PLUGIN_DEPEND_MK:=		${GZ_PLUGIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-plugin
endif

ifeq (+,$(GZ_PLUGIN_DEPEND_MK)) # ------------------------------------------

GZ_DEPEND_USE+=			gz-plugin
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-plugin?=		gz-plugin>=2
DEPEND_DIR.gz-plugin?=		../../devel/gz-plugin

SYSTEM_SEARCH.gz-plugin=\
  'include/gz/plugin[0-9]*/gz/plugin.hh'	\
  'lib/libgz-plugin[0-9]*.so'			\
  $(call gz_system_search,gz-plugin,)

endif # GZ_PLUGIN_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
