# robotpkg sysdep/libavresample.mk
# Created:			Anthony Mallet on Wed 12 Sep 2018
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
LIBAVRESAMPLE_DEPEND_MK:=	${LIBAVRESAMPLE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavresample
endif

ifeq (+,$(LIBAVRESAMPLE_DEPEND_MK)) # --------------------------------------

PREFER.libavresample?=		system
DEPEND_USE+=			libavresample
DEPEND_ABI.libavresample?=	libavresample>=2.8

SYSTEM_SEARCH.libavresample=\
  'include/{,ffmpeg*/}libavutil/ffversion.h:/FFMPEG_VERSION/s/[^0-9.]//gp' \
  'include/{,ffmpeg*/}libavresample/avresample.h'	\
  'lib/{,ffmpeg*/}libavresample.{so,a}'			\
  'lib/{,ffmpeg*/}pkgconfig/libavresample.pc'

SYSTEM_PKG.Debian.libavresample=libavresample-dev
SYSTEM_PKG.NetBSD.libavresample=multimedia/ffmpeg
SYSTEM_PKG.RedHat.libavresample=ffmpeg-devel

include ../../mk/sysdep/libavutil.mk

endif # LIBAVRESAMPLE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
