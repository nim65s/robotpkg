# robotpkg sysdep/libswscale.mk
# Created:			Anthony Mallet on Fri 17 Feb 2012
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSWSCALE_DEPEND_MK:=	${LIBSWSCALE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libswscale
endif

ifeq (+,$(LIBSWSCALE_DEPEND_MK)) # -----------------------------------------

PREFER.libswscale?=		system
DEPEND_USE+=			libswscale
DEPEND_ABI.libswscale?=		libswscale>=2.8

SYSTEM_SEARCH.libswscale=\
  'include/{,ffmpeg*/}libavutil/ffversion.h:/FFMPEG_VERSION/s/[^0-9.]//gp' \
  'include/{,ffmpeg*/}libswscale/swscale.h'	\
  'lib/{,ffmpeg*/}libswscale.{so,a}'		\
  'lib/{,ffmpeg*/}pkgconfig/libswscale.pc'

SYSTEM_PKG.Debian.libswscale=libswscale-dev
SYSTEM_PKG.NetBSD.libswscale=multimedia/ffmpeg
SYSTEM_PKG.RedHat.libswscale=ffmpeg-devel

include ../../mk/sysdep/libavutil.mk

endif # LIBSWSCALE_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
