# robotpkg depend.mk for:	path/py-hpp-manipulation-corba
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_HPP_MANIPULATION_CORBA_DEPEND_MK:=	${PY_HPP_MANIPULATION_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-hpp-manipulation-corba
endif

ifeq (+,$(PY_HPP_MANIPULATION_CORBA_DEPEND_MK)) # ---------------------------

PREFER.py-hpp-manipulation-corba?=	robotpkg

DEPEND_USE+=		py-hpp-manipulation-corba

DEPEND_ABI.py-hpp-manipulation-corba?=	${PKGTAG.python-}hpp-manipulation-corba>=4.7.0
DEPEND_DIR.py-hpp-manipulation-corba?=	../../path/py-hpp-manipulation-corba

SYSTEM_SEARCH.py-hpp-manipulation-corba=		\
	include/hpp/corbaserver/manipulation/server.hh  \
	lib/libhpp-manipulation-corba.so		\
	'lib/pkgconfig/hpp-manipulation-corba.pc:/Version/s/[^0-9.]//gp'

include ../../path/py-hpp-corbaserver/depend.mk
include ../../path/hpp-manipulation-urdf/depend.mk

endif # PY_HPP_MANIPULATION_CORBA_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
