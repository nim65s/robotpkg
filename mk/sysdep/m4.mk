# robotpkg sysdep/m4.mk
# Created:			Anthony Mallet on Mon Mar 24 2025
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
M4_DEPEND_MK:=		${M4_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		m4
endif

ifeq (+,$(M4_DEPEND_MK)) # -------------------------------------------------

PREFER.m4?=		system

DEPEND_USE+=		m4
DEPEND_ABI.m4?=		m4
DEPEND_METHOD.m4?=	build
SYSTEM_SEARCH.m4=	'bin/{g,gnu,}m4'

export M4=		$(word 1,${SYSTEM_FILES.m4})

endif # M4_DEPEND_MK -------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
