# robotpkg Makefile for:	math/ros-angles
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

ROS_PKG=	angles
ROS_METAPKG=	yes
ROS_VERSION=	1.9.13

CATEGORIES=	math
ROS_COMMENT=	simple math utilities to work with angles


include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=			py-distsetup
SUBST_FILES.py-distsetup=	angles/setup.py

include ../../devel/ros-catkin/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
