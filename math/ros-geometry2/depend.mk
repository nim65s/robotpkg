# robotpkg depend.mk for:	math/ros-geometry2
# Created:			Anthony Mallet on Tue, 16 May 2017
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_GEOMETRY2_DEPEND_MK:=	${ROS_GEOMETRY2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-geometry2
endif

ifeq (+,$(ROS_GEOMETRY2_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-geometry2?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-geometry2?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-geometry2
ROS_DEPEND_USE+=		ros-geometry2

DEPEND_DIR.ros-geometry2=	../../math/ros-geometry2

DEPEND_ABI.ros+=ros>=hydro

DEPEND_ABI.ros-geometry2.hydro+= ros-geometry2>=0.4<0.5
DEPEND_ABI.ros-geometry2.indigo+=ros-geometry2>=0.5<0.6
DEPEND_ABI.ros-geometry2.jade+=  ros-geometry2>=0.5<0.6
DEPEND_ABI.ros-geometry2.kinetic+=ros-geometry2>=0.5<0.6
DEPEND_ABI.ros-geometry2.lunar+= ros-geometry2>=0.5<0.6
DEPEND_ABI.ros-geometry2.melodic+=ros-geometry2>=0.6<0.7
DEPEND_ABI.ros-geometry2.noetic?=ros-geometry2>=0.7<0.8

SYSTEM_SEARCH.ros-geometry2=\
  'include/tf2/convert.h'						\
  'include/tf2_bullet/{,tf2_bullet/}tf2_bullet.h'			\
  'include/tf2_geometry_msgs/tf2_geometry_msgs.h'			\
  'include/tf2_kdl/{,tf2_kdl/}tf2_kdl.h'				\
  'include/tf2_msgs/FrameGraph.h'					\
  'include/tf2_ros/buffer.h'						\
  'lib/libtf2.so'							\
  'lib/pkgconfig/tf2.pc:/Version/s/[^0-9.]//gp'				\
  'lib/pkgconfig/tf2_bullet.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/tf2_geometry_msgs.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/tf2_kdl.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/tf2_msgs.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/tf2_py.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/tf2_ros.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/tf2_tools.pc:/Version/s/[^0-9.]//gp'			\
  'share/tf2/package.xml:/<version>/s/[^0-9.]//gp'			\
  'share/tf2_bullet/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/tf2_geometry_msgs/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/tf2_kdl/package.xml:/<version>/s/[^0-9.]//gp'			\
  'share/tf2_msgs/package.xml:/<version>/s/[^0-9.]//gp'			\
  'share/tf2_py/package.xml:/<version>/s/[^0-9.]//gp'			\
  'share/tf2_ros/package.xml:/<version>/s/[^0-9.]//gp'			\
  'share/tf2_tools/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_GEOMETRY2_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
