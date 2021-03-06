# robotpkg sysdep/mesa.mk
# Created:			Anthony Mallet on Tue Dec 15 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MESA_DEPEND_MK:=	${MESA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mesa
endif

ifeq (+,$(MESA_DEPEND_MK)) # -----------------------------------------------

PREFER.mesa?=		system

DEPEND_USE+=		mesa

DEPEND_ABI.mesa?=	mesa

SYSTEM_SEARCH.mesa=	\
  'include/GL/gl.h'				\
  'lib/libGL.so'				\
  'lib/pkgconfig/gl.pc'

SYSTEM_PKG.Fedora.mesa=	mesa-libGL-devel
SYSTEM_PKG.Debian.mesa=	libgl-dev
SYSTEM_PKG.NetBSD.mesa=	graphics/MesaLib
SYSTEM_PKG.Gentoo.mesa=	media-libs/mesa

endif # MESA_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
