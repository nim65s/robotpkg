# robotpkg depend.mk for:	interfaces/ros2-rosidl
# Created:			Anthony Mallet on Fri, 1 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2_ROSIDL_DEPEND_MK:=	${ROS2_ROSIDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2-rosidl
endif

ifeq (+,$(ROS2_ROSIDL_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-rosidl

# ros2-rosidl-4 introduced rosidl_generator_type_description
#
DEPEND_DIR.ros2-rosidl?=../../interfaces/ros2-rosidl
DEPEND_ABI.ros2-rosidl?=ros2-rosidl>=4

SYSTEM_SEARCH.ros2-rosidl=\
  $(call ros2_system_search,				\
    rosidl_adapter					\
    ?rosidl_buffer					\
    ?rosidl_buffer_backend				\
    ?rosidl_buffer_py					\
    rosidl_cmake					\
    rosidl_generator_c					\
    rosidl_generator_cpp				\
    rosidl_generator_type_description			\
    rosidl_parser					\
    rosidl_runtime_c					\
    rosidl_runtime_cpp					\
    rosidl_typesupport_interface			\
    rosidl_typesupport_introspection_c			\
    rosidl_typesupport_introspection_cpp)		\
  '${PYTHON_SITELIB}/rosidl_pycommon/__init__.py'	\
  '${PYTHON_SITELIB}/rosidl_cli/__init__.py'

DEPEND_ABI.ros2-rcutils= ros2-rcutils>=6.1

include ../../devel/ros2-rcpputils/depend.mk
include ../../devel/ros2-rcutils/depend.mk
include ../../mk/sysdep/py-empy.mk
include ../../mk/sysdep/python.mk

# PLIST handling depending on existing ROS adapters and generators.
# Those generators generate different files depending on their version.
#
PLIST_FILTER_CLASSES+= rosidl

PLIST_FILTER_STAGE.rosidl=	post-subst
PLIST_FILTER_AWK_PROG.rosidl=	${DEPEND_DIR.ros2-rosidl}/files/plist.awk

endif # ROS2_ROSIDL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
