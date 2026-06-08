# robotpkg Makefile for:	devel/ros2-pluginlib
# Created:			Anthony Mallet on Tue,  9 Jun 2026
#

ROS2_PKG=	pluginlib
ROS2_VERSION=	6.0.0
ROS2_REPO=	ros

CATEGORIES=	devel
ROS2_COMMENT=	dynamically loading plugins using the ROS build infrastructure

CONFLICTS+=	ros-pluginlib-[0-9]*

ROS2_SUBPKGS=\
    pluginlib	\
  python:	\
    ros2plugin

include ../../meta-pkgs/ros2-core/Makefile.common

DEPEND_ABI.g++ += g++>=9 # std::filesystem

include ../../devel/ros2-class-loader/depend.mk
include ../../devel/ros2-rcpputils/depend.mk
include ../../devel/ros2-rcutils/depend.mk
include ../../sysutils/ament-index/depend.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
