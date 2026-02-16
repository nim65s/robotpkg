# robotpkg depend.mk for:	optimization/blasfeo
# Created:			Guilhem Saurel on Mon, 16 Jan 2026
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
BLASFEO_DEPEND_MK:=		${BLASFEO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			blasfeo
endif

ifeq (+,$(BLASFEO_DEPEND_MK)) # ---------------------------------------

PREFER.blasfeo?=		robotpkg

DEPEND_USE+=			blasfeo

DEPEND_ABI.blasfeo?=		blasfeo>=0.1.4.2
DEPEND_DIR.blasfeo?=		../../optimization/blasfeo

SYSTEM_SEARCH.blasfeo=		\
  'cmake/blasfeoConfig.cmake'	\
  'include/blasfeo.h'		\
  'lib/libblasfeo.so'

endif # BLASFEO_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
