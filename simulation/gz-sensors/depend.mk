# robotpkg depend.mk for:	simulation/gz-sensors
# Created:			Anthony Mallet on Fri, 28 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_SENSORS_DEPEND_MK:=		${GZ_SENSORS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-sensors
endif

ifeq (+,$(GZ_SENSORS_DEPEND_MK)) # -----------------------------------------

GZ_DEPEND_USE+=			gz-sensors
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-sensors?=		gz-sensors>=8
DEPEND_DIR.gz-sensors?=		../../simulation/gz-sensors

SYSTEM_SEARCH.gz-sensors=\
  'include/gz/sensors[0-9]*/gz/sensors.hh'	\
  'lib/libgz-sensors[0-9]*.so'			\
  $(call gz_system_search,gz-sensors,)

# transitive dependencies
include ../../graphics/gz-common/depend.mk
include ../../graphics/gz-rendering/depend.mk
include ../../graphics/sdformat/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../math/gz-math/depend.mk
include ../../net/gz-transport/depend.mk
include ../../mk/sysdep/protobuf.mk

endif # GZ_SENSORS_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
