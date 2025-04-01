# robotpkg depend.mk for:	intefaces/camera-libgenom3
# Created:			Anthony Mallet on Tue,  1 Apr 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
CAMERA_LIBGENOM3_DEPEND_MK:=	${CAMERA_LIBGENOM3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			camera-libgenom3
endif

ifeq (+,$(CAMERA_LIBGENOM3_DEPEND_MK)) # -----------------------------------

DEPEND_USE+=			camera-libgenom3
PREFER.camera-libgenom3?=	robotpkg

SYSTEM_SEARCH.camera-libgenom3=\
  'include/camera/camera.h'	\
  'share/idl/camera/camera.gen'	\
  'lib/pkgconfig/camera-libgenom3.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.camera-libgenom3?=	camera-libgenom3>=1.0
DEPEND_DIR.camera-libgenom3?=	../../interfaces/camera-libgenom3

endif # CAMERA_LIBGENOM3_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
