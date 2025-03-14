# robotpkg depend.mk for:	archivers/bzip2
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BZIP2_DEPEND_MK:=	${BZIP2_DEPEND_MK}+

ifeq (+,$(BZIP2_DEPEND_MK)) # ----------------------------------------------

include ../../archivers/bzip2/depend-lib.mk
include ../../archivers/bzip2/depend-tool.mk

endif # BZIP2_DEPEND_MK ----------------------------------------------------

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		$(filter bzip2,${DEPEND_USE})
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
