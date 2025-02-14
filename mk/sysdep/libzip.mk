# robotpkg sysdep/libzip.mk
# Created:			Anthony Mallet on Fri, 14 Feb 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBZIP_DEPEND_MK:=	${LIBZIP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libzip
endif

ifeq (+,$(LIBZIP_DEPEND_MK)) # ---------------------------------------------

PREFER.libzip?=	system

DEPEND_USE+=		libzip

DEPEND_ABI.libzip?=	libzip>=1

SYSTEM_SEARCH.libzip=\
  'include/zip.h'				\
  'lib/libzip.so'				\
  'lib/pkgconfig/libzip.pc:/Version/s/[^.0-9]//gp'

SYSTEM_PKG.Debian.libzip=libzip-dev
SYSTEM_PKG.RedHat.libzip=libzip-devel
SYSTEM_PKG.NetBSD.libzip=archivers/libzip

endif # LIBZIP_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
