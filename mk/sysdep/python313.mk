# robotpkg sysdep/python313.mk
# Created:			Anthony Mallet on Wed, 23 Apr 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON313_DEPEND_MK:=	${PYTHON313_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python313
endif

ifeq (+,$(PYTHON313_DEPEND_MK)) # ------------------------------------------

DEPEND_USE+=		python313

include ../../mk/sysdep/python.mk
PREFER.python313?=	system

DEPEND_ABI.python313?=	python313>=3.13<3.14

# see sysdep/python.mk for the definition of SYSTEM_SEARCH.python
_py_search313=		{3.13,3,}{,d}{,m}{,u}
SYSTEM_SEARCH.python313=$(call _py_syssearch,${_py_search313})

SYSTEM_PKG.Fedora.python313=	python3-devel
SYSTEM_PKG.Debian.python313=	python3-dev
SYSTEM_PKG.NetBSD.python313=	lang/python313

# directory for byte compiled files
PYTHON313_TAG=		.cpython-313
PYTHON313_PYCACHE=	__pycache__

export PYTHON313=	$(firstword ${SYSTEM_FILES.python313})
export PYTHON313_LIB=	$(word 2,${SYSTEM_FILES.python313})
export PYTHON313_INCLUDE=$(dir $(word 3,${SYSTEM_FILES.python313}))

endif # PYTHON313_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
