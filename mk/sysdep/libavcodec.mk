# robotpkg sysdep/libavcodec.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVCODEC_DEPEND_MK:=	${LIBAVCODEC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavcodec
endif

ifeq (+,$(LIBAVCODEC_DEPEND_MK)) # -----------------------------------------

PREFER.libavcodec?=		system
DEPEND_USE+=			libavcodec
DEPEND_ABI.libavcodec?=		libavcodec>=2.8

SYSTEM_SEARCH.libavcodec=\
  'include/{,ffmpeg*/}libavutil/ffversion.h:/FFMPEG_VERSION/s/[^0-9.]//gp' \
  'include/{,ffmpeg*/}libavcodec/avcodec.h'	\
  'lib/{,ffmpeg*/}libavcodec.{so,a}'		\
  'lib/{,ffmpeg*/}pkgconfig/libavcodec.pc'

SYSTEM_PKG.Debian.libavcodec=libavcodec-dev
SYSTEM_PKG.NetBSD.libavcodec=multimedia/ffmpeg
SYSTEM_PKG.RedHat.libavcodec=ffmpeg-devel

include ../../mk/sysdep/libavutil.mk

endif # LIBAVCODEC_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
