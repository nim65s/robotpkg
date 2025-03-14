# robotpkg depend.mk for:	archivers/zlib
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ZLIB_DEPEND_MK:=	${ZLIB_DEPEND_MK}+

ifeq (+,$(ZLIB_DEPEND_MK)) # -----------------------------------------

include ../../archivers/zlib/depend-dev.mk
include ../../archivers/zlib/depend-lib.mk

endif # ZLIB_DEPEND_MK -----------------------------------------------

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		$(filter zlib,${DEPEND_USE})
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
