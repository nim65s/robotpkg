# robotpkg sysdep/libXrandr.mk
# Created:			Anthony Mallet on Thu 14 Aug 2025
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBXRANDR_DEPEND_MK:=	${LIBXRANDR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libXrandr
endif

ifeq (+,$(LIBXRANDR_DEPEND_MK)) # ------------------------------------------

PREFER.libXrandr?=	system
DEPEND_USE+=		libXrandr
DEPEND_ABI.libXrandr?=	libXrandr>=1

SYSTEM_SEARCH.libXrandr=\
  'include/X11/extensions/Xrandr.h'	\
  'lib/libXrandr.so'			\
  'lib/pkgconfig/xrandr.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libXrandr=libXrandr-devel
SYSTEM_PKG.Ubuntu.libXrandr=libxrandr-dev
SYSTEM_PKG.Debian.libXrandr=libxrandr-dev
SYSTEM_PKG.NetBSD.libXrandr=x11/libXrandr

endif # LIBXRANDR_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
