# robotpkg sysdep/libavformat.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVFORMAT_DEPEND_MK:=	${LIBAVFORMAT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavformat
endif

ifeq (+,$(LIBAVFORMAT_DEPEND_MK)) # ----------------------------------------

PREFER.libavformat?=		system
DEPEND_USE+=			libavformat
DEPEND_ABI.libavformat?=	libavformat>=2.8

SYSTEM_SEARCH.libavformat=\
  'include/{,ffmpeg*/}libavutil/ffversion.h:/FFMPEG_VERSION/s/[^0-9.]//gp' \
  'include/{,ffmpeg*/}libavformat/avformat.h'		\
  'lib/{,ffmpeg*/}libavformat.{so,a}'			\
  'lib/{,ffmpeg*/}pkgconfig/libavformat.pc'

SYSTEM_PKG.Debian.libavformat=libavformat-dev
SYSTEM_PKG.NetBSD.libavformat=multimedia/ffmpeg
SYSTEM_PKG.RedHat.libavformat=ffmpeg-devel

include ../../mk/sysdep/libavutil.mk

endif # LIBAVFORMAT_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
