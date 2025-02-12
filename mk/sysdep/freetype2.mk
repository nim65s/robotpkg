# robotpkg sysdep/freetype2.mk
# Created:			Anthony Mallet on Fri,  6 May 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FREETYPE2_DEPEND_MK:=	${FREETYPE2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		freetype2
endif

ifeq (+,$(FREETYPE2_DEPEND_MK)) # ------------------------------------------

PREFER.freetype2?=	system

DEPEND_USE+=		freetype2

DEPEND_ABI.freetype2?=	freetype2>=2

SYSTEM_SEARCH.freetype2=\
  'include/freetype2/{,freetype/}freetype.h:${_ft_version_sed}'	\
  'lib/libfreetype.{so,a}'					\
  'lib/pkgconfig/freetype2.pc' # .pc contains a strange version

# extracting version from the header file
_ft_version_sed=\
  /define FREETYPE_\(MAJOR\|MINOR\|PATCH\)/{s/[^0-9]//g;H;};	\
  $${x;s/\n/./g;s/^\.//p;}

SYSTEM_PKG.Fedora.freetype2=	freetype-devel
SYSTEM_PKG.Debian.freetype2=	libfreetype-dev
SYSTEM_PKG.NetBSD.freetype2=	graphics/freetype2

endif # FREETYPE2_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
