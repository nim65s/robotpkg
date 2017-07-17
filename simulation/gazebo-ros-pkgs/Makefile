# robotpkg Makefile for:	simulation/ros-gazebo-ros-pkgs
# Created:			Anthony Mallet on Thu, 15 Jun 2017
#

ROS_PKG=	gazebo_ros_pkgs
ROS_METAPKG=	yes
ROS_VERSION=	2.4.13
ROS_REPO=       ros-simulation

CATEGORIES=	simulation
ROS_COMMENT=	wrappers, tools for using the Gazebo simulator
HOMEPAGE=	http://wiki.ros.org/gazebo_ros_pkgs

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp

SUBST_FILES.py-interp+=	gazebo_plugins/scripts/*.py
SUBST_FILES.py-interp+=	gazebo_plugins/cfg/*.cfg
SUBST_FILES.py-interp+=	gazebo_ros/scripts/spawn_model
SUBST_FILES.py-interp+=	gazebo_ros/cfg/*.cfg

CMAKE_ARGS+=	-DTinyXML_INCLUDE_PATH=${PREFIX.tinyxml}/include
CMAKE_ARGS+=	-DTinyXML_LIBRARY_PATH=${PREFIX.tinyxml}/lib

include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-nodelet-core/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../graphics/ros-robot-model/depend.mk
include ../../hardware/ros-driver-common/depend.mk
include ../../image/ros-image-common/depend.mk
include ../../image/ros-vision-opencv/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../math/ros-angles/depend.mk
include ../../math/ros-geometry/depend.mk
include ../../math/ros-geometry2/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-dynamic-reconfigure/depend.mk
include ../../motion/ros-control-toolbox/depend.mk
include ../../motion/ros-control/depend.mk
include ../../sysutils/ros-diagnostics/depend.mk
include ../../mk/sysdep/libxml2.mk
include ../../mk/sysdep/tinyxml.mk
include ../../mk/robotpkg.mk