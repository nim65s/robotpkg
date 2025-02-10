# robotpkg depend.mk for:	simulation/gz-physics
# Created:			Anthony Mallet on Mon, 10 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_PHYSICS_DEPEND_MK:=		${GZ_PHYSICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-physics
endif

ifeq (+,$(GZ_PHYSICS_DEPEND_MK)) # -----------------------------------------

GZ_DEPEND_USE+=			gz-physics
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-physics?=		gz-physics>=7
DEPEND_DIR.gz-physics?=		../../simulation/gz-physics

SYSTEM_SEARCH.gz-physics=\
  'include/gz/physics[0-9]*/gz/physics.hh'	\
  'lib/libgz-physics[0-9]*.so'			\
  $(call gz_system_search,gz-physics,		\
    bullet dartsim heightmap mesh sdf tpe)

endif # GZ_PHYSICS_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
