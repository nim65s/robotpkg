# robotpkg sysdep/freeimage.mk
# Created:			Anthony Mallet on Mon, 10 Feb 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FREEIMAGE_DEPEND_MK:=	${FREEIMAGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		freeimage
endif

ifeq (+,$(FREEIMAGE_DEPEND_MK)) # ------------------------------------------

PREFER.freeimage?=	system
DEPEND_USE+=		freeimage
DEPEND_ABI.freeimage?=	freeimage>=3

SYSTEM_SEARCH.freeimage=\
  'include/FreeImage.h:${_freeimage_version_sed}'	\
  'lib/libfreeimage.so'

SYSTEM_PKG.Fedora.freeimage=	freeimage-devel
SYSTEM_PKG.Debian.freeimage=	libfreeimage-dev
SYSTEM_PKG.NetBSD.freeimage=	graphics/freeimage

# extracting version from the header file
_freeimage_version_sed=\
 /FREEIMAGE_\(MAJOR\|MINOR\|RELEASE\)/{s/[^0-9]//g;H;};$${x;s/\n/./g;s/^\.//p;}

endif # FREEIMAGE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
