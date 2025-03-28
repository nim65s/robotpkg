# robotpkg depend.mk for:	simulation/mrsim-gazebo-classic
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MRSIM_GAZEBO_CLASSIC_DEPEND_MK:=${MRSIM_GAZEBO_CLASSIC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mrsim-gazebo-classic
endif

ifeq (+,$(MRSIM_GAZEBO_CLASSIC_DEPEND_MK)) # -------------------------------

PREFER.mrsim-gazebo-classic?=	robotpkg

SYSTEM_SEARCH.mrsim-gazebo-classic=\
  'lib/gazebo/mrsim-gazebo.so'					\
  'lib/pkgconfig/mrsim-gazebo.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		mrsim-gazebo-classic

DEPEND_ABI.mrsim-gazebo-classic?=	mrsim-gazebo-classic>=1.0<2
DEPEND_DIR.mrsim-gazebo-classic?=	../../simulation/mrsim-gazebo-classic

endif # MRSIM_GAZEBO_CLASSIC_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
