# robotpkg depend.mk for:	optimization/py27-crocoddyl
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_CROCODDYL_DEPEND_MK:=	${PY_CROCODDYL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-crocoddyl
endif

ifeq (+,$(PY_CROCODDYL_DEPEND_MK)) # ---------------------------------------

PREFER.py-crocoddyl?=		robotpkg

DEPEND_USE+=			py-crocoddyl

DEPEND_ABI.py-crocoddyl?=	${PKGTAG.python-}crocoddyl>=0.9.0
DEPEND_DIR.py-crocoddyl?=	../../optimization/py-crocoddyl

SYSTEM_SEARCH.py-crocoddyl=\
  '${PYTHON_SYSLIBSEARCH}/crocoddyl/__init__.py'

include ../../mk/sysdep/python.mk

endif # PY_CROCODDYL_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
