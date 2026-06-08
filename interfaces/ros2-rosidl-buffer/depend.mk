# robotpkg depend.mk for:	interfaces/ros2-rosidl-buffer
# Created:			Anthony Mallet on Tue, 9 Jun 2026
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_ROSIDL_BUFFER_DEPEND_MK:=	${ROS2_ROSIDL_BUFFER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-buffer
endif

ifeq (+,$(ROS2_ROSIDL_BUFFER_DEPEND_MK)) # ---------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-rosidl-buffer

DEPEND_DIR.ros2-rosidl-buffer?=../../interfaces/ros2-rosidl-buffer
DEPEND_ABI.ros2-rosidl-buffer?=ros2-rosidl-buffer>=4

SYSTEM_SEARCH.ros2-rosidl-buffer=\
  $(call ros2_system_search,			\
    rosidl_buffer_backend			\
    rosidl_buffer_backend_registry)		\

endif # ROS2_ROSIDL_BUFFER_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
