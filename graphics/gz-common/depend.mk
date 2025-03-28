# robotpkg depend.mk for:	graphics/gz-common
# Created:			Anthony Mallet on Mon, 10 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_COMMON_DEPEND_MK:=		${GZ_COMMON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-common
endif

ifeq (+,$(GZ_COMMON_DEPEND_MK)) # --------------------------------------------

GZ_DEPEND_USE+=			gz-common
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-common?=		gz-common>=5
DEPEND_DIR.gz-common?=		../../graphics/gz-common

SYSTEM_SEARCH.gz-common=\
  'include/gz/common[0-9]*/gz/common.hh'	\
  'lib/libgz-common[0-9]*.so'			\
  $(call gz_system_search,gz-common,		\
    av events geospatial graphics io profiler)

# transitive dependencies
DEPEND_ABI.libavdevice+=libavdevice>=56.4.100

include ../../devel/gz-utils/depend.mk
include ../../mk/sysdep/libavcodec.mk
include ../../mk/sysdep/libavdevice.mk
include ../../mk/sysdep/libavformat.mk
include ../../mk/sysdep/libavutil.mk
include ../../mk/sysdep/libswscale.mk
include ../../mk/sysdep/libuuid.mk

endif # GZ_COMMON_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
