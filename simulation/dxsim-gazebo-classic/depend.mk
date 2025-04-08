# robotpkg depend.mk for:	simulation/dxsim-gazebo-classic
# Created:			Anthony Mallet on Thu, 20 Jul 2023
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
DXSIM_GAZEBO_CLASSIC_DEPEND_MK:=${DXSIM_GAZEBO_CLASSIC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			dxsim-gazebo-classic
endif

ifeq (+,$(DXSIM_GAZEBO_CLASSIC_DEPEND_MK)) # -------------------------------

PREFER.dxsim-gazebo-classic?=	robotpkg

SYSTEM_SEARCH.dxsim-gazebo-classic=\
  'lib/gazebo/dxsim-gazebo.so'					\
  'lib/pkgconfig/dxsim-gazebo.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		dxsim-gazebo-classic

DEPEND_ABI.dxsim-gazebo-classic?=	dxsim-gazebo-classic>=1.0
DEPEND_DIR.dxsim-gazebo-classic?=	../../simulation/dxsim-gazebo-classic

endif # DXSIM_GAZEBO_CLASSIC_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
