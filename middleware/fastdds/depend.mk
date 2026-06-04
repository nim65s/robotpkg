# robotpkg depend.mk for:	middleware/fastdds
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FASTDDS_DEPEND_MK:=	${FASTDDS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		fastdds
endif

ifeq (+,$(FASTDDS_DEPEND_MK)) # --------------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	fastdds

DEPEND_ABI.fastdds?=	fastdds>=3
DEPEND_DIR.fastdds?=	../../middleware/fastdds

SYSTEM_SEARCH.fastdds=\
  'include/fastdds/config.hpp:/FASTDDS_VERSION_STR/s/[^0-9.]//gp'	\
  'lib/libfastdds.so'							\
  'share/fastdds/cmake/fastdds-config.cmake'

include ../../devel/foonathan-memory/depend.mk
include ../../middleware/fastcdr/depend.mk
include ../../mk/sysdep/tinyxml2.mk

endif # FASTDDS_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
