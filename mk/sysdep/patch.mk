# robotpkg sysdep/patch.mk
# Created:			Anthony Mallet on Wed Jan 14 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PATCH_DEPEND_MK:=	${PATCH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		patch
endif

ifeq (+,$(PATCH_DEPEND_MK)) # ----------------------------------------------

PREFER.patch?=		system

DEPEND_USE+=		patch
DEPEND_ABI.patch?=	patch>=2.0
DEPEND_METHOD.patch?=	build

SYSTEM_SEARCH.patch=\
  'bin/patch:/[Pp]atch/s/[^0-9.]//gp:% -v'				\
  'bin/patch:/[Pp]atch/s/[^0-9.]//gp:% --posix -v:~posix'

export PATCH=$(join ,							\
  $(word 1,${SYSTEM_FILES.patch})					\
  $(if $(filter /notfound,$(word 2,${SYSTEM_FILES.patch})),,--posix))

endif # PATCH_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
