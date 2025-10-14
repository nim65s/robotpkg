# robotpkg sysdep/libavdevice.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBAVDEVICE_DEPEND_MK:=	${LIBAVDEVICE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libavdevice
endif

ifeq (+,$(LIBAVDEVICE_DEPEND_MK)) # ----------------------------------------

PREFER.libavdevice?=		system
DEPEND_USE+=			libavdevice
DEPEND_ABI.libavdevice?=	libavdevice>=2.8

SYSTEM_SEARCH.libavdevice=\
  'include/{,ffmpeg*/}libavutil/ffversion.h:/FFMPEG_VERSION/s/[^0-9.]//gp' \
  'include/{,ffmpeg*/}libavdevice/avdevice.h'	\
  'lib/{,ffmpeg*/}libavdevice.{so,a}'		\
  'lib/{,ffmpeg*/}pkgconfig/libavdevice.pc'

SYSTEM_PKG.Debian.libavdevice=libavdevice-dev
SYSTEM_PKG.NetBSD.libavdevice=multimedia/ffmpeg
SYSTEM_PKG.RedHat.libavdevice=ffmpeg-devel

include ../../mk/sysdep/libavutil.mk

endif # LIBAVDEVICE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
