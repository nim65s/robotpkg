# robotpkg depend.mk for:	devel/ros2-pluginlib
# Created:			Anthony Mallet on Wed, 13 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_PLUGINLIB_DEPEND_MK:=	${ROS2_PLUGINLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-pluginlib
endif

ifeq (+,$(ROS2_PLUGINLIB_DEPEND_MK)) # -------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-pluginlib

DEPEND_ABI.ros2-pluginlib?=	ros2-pluginlib>=2
DEPEND_DIR.ros2-pluginlib?=	../../devel/ros2-pluginlib

SYSTEM_SEARCH.ros2-pluginlib=\
  $(call ros2_system_search, pluginlib)		\
  '${PYTHON_SITELIB}/ros2plugin/__init__.py'	\
  'share/ros2plugin/package.xml:/<version>/s/[^0-9.]//gp'

include ../../devel/ros2-rcpputils/depend.mk

endif # ROS2_PLUGINLIB_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
