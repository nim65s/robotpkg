# robotpkg depend.mk for:	middleware/py-yarp
# Created:			Arnaud Degroote on Thu, 15 Jul 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PY_YARP_DEPEND_MK:=	${PY_YARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-yarp
endif

ifeq (+,$(PY_YARP_DEPEND_MK)) # --------------------------------------------

PREFER.py-yarp?=	robotpkg

DEPEND_USE+=		py-yarp
DEPEND_ABI.py-yarp?=	${PKGTAG.python-}yarp>=2.3.1
DEPEND_DIR.py-yarp?=	../../middleware/py-yarp

SYSTEM_SEARCH.py-yarp=\
	'${PYTHON_SYSLIBSEARCH}/yarp.py'

PYTHONPATH.py-yarp=	$(dir $(word 1,${SYSTEM_FILES.py-yarp}))

include ../../middleware/yarp/depend.mk
include ../../mk/sysdep/python.mk

endif # PY_YARP_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
