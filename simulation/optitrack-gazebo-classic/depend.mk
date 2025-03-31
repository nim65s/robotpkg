# robotpkg depend.mk for:	simulation/optitrack-gazebo
# Created:			Anthony Mallet on Tue, 11 Jun 2019
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPTITRACK_GAZEBO_CLASSICDEPEND_MK:=${OPTITRACK_GAZEBO_CLASSICDEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			optitrack-gazebo-classic
endif

ifeq (+,$(OPTITRACK_GAZEBO_CLASSICDEPEND_MK)) # ----------------------------

PREFER.optitrack-gazebo-classic?=	robotpkg

SYSTEM_SEARCH.optitrack-gazebo-classic=\
  'lib/gazebo/optitrack-gazebo.so'				\
  'lib/pkgconfig/optitrack-gazebo.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			optitrack-gazebo-classic

DEPEND_ABI.optitrack-gazebo-classic?=optitrack-gazebo-classic>=1.0<2
DEPEND_DIR.optitrack-gazebo-classic?=../../simulation/optitrack-gazebo-classic

endif # OPTITRACK_GAZEBO_CLASSICDEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
