# robotpkg sysdep/python314.mk
# Created:			Anthony Mallet on Wed,  2 Sep 2026
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON314_DEPEND_MK:=	${PYTHON314_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python314
endif

ifeq (+,$(PYTHON314_DEPEND_MK)) # ------------------------------------------

DEPEND_USE+=		python314

include ../../mk/sysdep/python.mk
PREFER.python314?=	system

DEPEND_ABI.python314?=	python314>=3.14<3.15

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search314=		{3.14,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python314=$(call _py_syssearch,${_py_search314})

SYSTEM_PKG.Fedora.python314=	python3-devel
SYSTEM_PKG.Debian.python314=	python3-dev
SYSTEM_PKG.NetBSD.python314=	lang/python314

# directory for byte compiled files
PYTHON314_TAG=		.cpython-314
PYTHON314_PYCACHE=	__pycache__

export PYTHON314=	$(firstword ${SYSTEM_FILES.python314})
export PYTHON314_LIB=	$(word 2,${SYSTEM_FILES.python314})
export PYTHON314_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python314}))

endif # PYTHON314_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
