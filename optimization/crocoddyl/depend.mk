# robotpkg depend.mk for:	optimization/crocoddyl
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
CROCODDYL_DEPEND_MK:=		${CROCODDYL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			crocoddyl
endif

ifeq (+,$(CROCODDYL_DEPEND_MK)) # ---------------------------------------

PREFER.crocoddyl?=		robotpkg

DEPEND_USE+=			crocoddyl

DEPEND_ABI.crocoddyl?=		crocoddyl>=3.1.0
DEPEND_DIR.crocoddyl?=		../../optimization/crocoddyl

SYSTEM_SEARCH.crocoddyl=\
  'include/crocoddyl/config.hh:/CROCODDYL_VERSION /s/[^0-9.]//gp'	\
  'lib/cmake/crocoddyl/crocoddylConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'\
  'lib/pkgconfig/crocoddyl.pc:/Version/s/[^0-9.]//gp'

endif # CROCODDYL_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
