# robotpkg sysdep/libXaw.mk
# Created:			Anthony Mallet on Thu, 13 Feb 2025
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXAW_DEPEND_MK:=	${LIBXAW_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXaw
endif

ifeq (+,$(LIBXAW_DEPEND_MK)) # ---------------------------------------------

PREFER.libXaw?=		system
DEPEND_USE+=		libXaw
DEPEND_ABI.libXaw?=	libXaw>=1

SYSTEM_SEARCH.libXaw=\
  'include/X11/Xaw/XawInit.h'			\
  'lib/libXaw7.so'				\
  'lib/pkgconfig/xaw7.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.RedHat.libXaw=libXaw-devel
SYSTEM_PKG.Debian.libXaw=libxaw7-dev
SYSTEM_PKG.NetBSD.libXaw=x11/libXaw

endif # LIBXAW_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
