# robotpkg sysdep/libavfilter.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVFILTER_DEPEND_MK:=	${LIBAVFILTER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavfilter
endif

ifeq (+,$(LIBAVFILTER_DEPEND_MK)) # ----------------------------------------

PREFER.libavfilter?=		system
DEPEND_USE+=			libavfilter
DEPEND_ABI.libavfilter?=	libavfilter>=2.8

SYSTEM_SEARCH.libavfilter=\
  'include/{,ffmpeg*/}libavutil/ffversion.h:/FFMPEG_VERSION/s/[^0-9.]//gp' \
  'include/{,ffmpeg/}libavfilter/avfilter.h'	\
  'lib/libavfilter.{so,a}'			\
  'lib/pkgconfig/libavfilter.pc'

SYSTEM_PKG.Debian.libavfilter=libavfilter-dev
SYSTEM_PKG.NetBSD.libavfilter=multimedia/ffmpeg
SYSTEM_PKG.Fedora.libavfilter=ffmpeg-devel

include ../../mk/sysdep/libavutil.mk

endif # LIBAVFILTER_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
