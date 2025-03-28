# robotpkg depend.mk for:	simulation/gz-sim
# Created:			Anthony Mallet on Wed,  5 Mar 2025
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GZ_SIM_DEPEND_MK:=	${GZ_SIM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gz-sim
endif

ifeq (+,$(GZ_SIM_DEPEND_MK)) # -----------------------------------------

GZ_DEPEND_USE+=		gz-sim
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-sim?=	gz-sim>=8
DEPEND_DIR.gz-sim?=	../../simulation/gz-sim

SYSTEM_SEARCH.gz-sim=\
  'include/gz/sim[0-9]*/gz/sim.hh'	\
  'lib/libgz-sim[0-9]*.so'		\
  $(call gz_system_search,gz-sim)

# transitive dependencies
include ../../devel/gz-plugin/depend.mk
include ../../devel/gz-utils/depend.mk
include ../../graphics/gz-common/depend.mk
include ../../graphics/gz-gui/depend.mk
include ../../graphics/gz-rendering/depend.mk
include ../../graphics/sdformat/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../math/gz-math/depend.mk
include ../../net/gz-fuel-tools/depend.mk
include ../../simulation/gz-physics/depend.mk
include ../../simulation/gz-sensors/depend.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/sysdep/qt5-declarative.mk
include ../../mk/sysdep/qt5-quickcontrols2.mk

endif # GZ_SIM_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
