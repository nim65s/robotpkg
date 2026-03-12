# robotpkg Makefile for:	devel/roscpp-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=	roscpp_core
ROS_METAPKG=	yes
ROS_VERSION=	0.7.3

CATEGORIES=	devel
ROS_COMMENT=	underlying data libraries for roscpp messages

include ../../meta-pkgs/ros-base/Makefile.common

DEPEND_ABI.console-bridge += console-bridge>=0.4

include ../../devel/ros-catkin/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/robotpkg.mk
