# robotpkg depend.mk for:	path/py-hpp-tutorial
# Created:			Florent Lamiraux on Thu, 12 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_HPP_TUTORIAL_DEPEND_MK:=	${PY_HPP_TUTORIAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-tutorial
endif

ifeq (+,$(PY_HPP_TUTORIAL_DEPEND_MK)) # --------------------------------------

PREFER.py-hpp-tutorial?=	robotpkg

DEPEND_USE+=			py-hpp-tutorial

DEPEND_ABI.py-hpp-tutorial?=	${PKGTAG.python-}hpp_tutorial>=4.7.0
DEPEND_DIR.py-hpp-tutorial?=	../../doc/py-hpp-tutorial

SYSTEM_SEARCH.py-hpp-tutorial=\
	bin/hpp-tutorial-server		\
	'lib/pkgconfig/hpp_tutorial.pc:/Version/s/[^0-9.]//gp'

include ../../path/py-hpp-manipulation-corba/depend.mk

endif # PY_HPP_TUTORIAL_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
