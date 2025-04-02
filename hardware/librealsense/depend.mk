# robotpkg depend.mk for:	hardware/librealsense
# Created:			Anthony Mallet on Wed,  2 Apr 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBREALSENSE_DEPEND_MK:=	${LIBREALSENSE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		librealsense
endif

ifeq (+,$(LIBREALSENSE_DEPEND_MK)) # ---------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 18.04% 20.04% 22.04%,${OS_VERSION}))
    PREFER.librealsense?=	system
  endif
endif
PREFER.librealsense?=		robotpkg

DEPEND_USE+=			librealsense

DEPEND_ABI.librealsense?=	librealsense>=2
DEPEND_DIR.librealsense?=	../../hardware/librealsense

SYSTEM_SEARCH.librealsense=\
  'include/librealsense2/rs.h'			\
  'lib/librealsense2.so'			\
  'lib/cmake/realsense2/realsense2Config.cmake'	\
  'lib/pkgconfig/realsense2.pc:/Version/s/[^0-9.]//gp'

endif # LIBREALSENSE_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
