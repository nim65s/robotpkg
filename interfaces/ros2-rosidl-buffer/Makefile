# robotpkg Makefile for:	interfaces/ros2-rosidl-buffer
# Created:			Anthony Mallet on Tue, 9 Jun 2026
#

ROS2_PKG=	rosidl
ROS2_VERSION=	5.3.1
PKGNAME=        ros2-rosidl-buffer-${ROS2_VERSION}

CATEGORIES=	interfaces
ROS2_COMMENT=	ROS2 native buffer feature

# This is a split of the ros2-rosidl to avoid circular dependency with
# ros2-rwm
#
ROS2_SUBPKGS=\
    rosidl_buffer_backend		\
    rosidl_buffer_backend_registry

include ../../meta-pkgs/ros2-core/Makefile.common

include ../../devel/ros2-pluginlib/depend.mk
include ../../interfaces/ros2-rosidl/depend.mk
include ../../middleware/ros2-rmw/depend.mk
include ../../mk/robotpkg.mk
