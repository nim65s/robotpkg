# robotpkg mk/sysdep/ninja.mk
# Created:		Guilhem Saurel on Mon, 29 Aug 2022
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NINJA_DEPEND_MK:=	${NINJA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ninja
endif

ifeq (+,$(NINJA_DEPEND_MK)) # ------------------------------------------------

PREFER.ninja?=		system
DEPEND_USE+=		ninja
DEPEND_ABI.ninja?=	ninja>=1.10.0

SYSTEM_SEARCH.ninja=	\
    'bin/ninja:p:% --version'

SYSTEM_PKG.Arch.ninja=		ninja
SYSTEM_PKG.Debian.ninja=	ninja-build

endif # NINJA_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
