# robotpkg Makefile for:	interfaces/ros2-rosidl
# Created:			Anthony Mallet on Fri, 1 Apr 2022
#

ROS2_PKG=	rosidl
ROS2_VERSION=	5.3.1

CATEGORIES=	interfaces
ROS2_COMMENT=	API and scripts to manipulate .msg/.srv/.action files.

ROS2_SUBPKGS=\
    rosidl_adapter				\
    rosidl_buffer				\
    rosidl_buffer_py				\
    rosidl_cmake				\
    rosidl_typesupport_interface		\
    rosidl_runtime_c				\
    rosidl_generator_c				\
    rosidl_generator_cpp			\
    rosidl_generator_type_description		\
    rosidl_parser				\
    rosidl_runtime_cpp				\
    rosidl_typesupport_introspection_c		\
    rosidl_typesupport_introspection_cpp	\
  python:					\
    rosidl_pycommon				\
    rosidl_cli

include ../../meta-pkgs/ros2-core/Makefile.common

# Force cmake to find exact python version
SUBST_CLASSES+= py-vers
SUBST_STAGE.py-vers=    pre-configure
SUBST_MESSAGE.py-vers=  Forcing exact python version search
SUBST_SED.py-vers=\
  -e 's|package(Python3 REQ|package(Python3 ${PYTHON_VERSION} EXACT REQ|'
SUBST_FILES.py-vers=\
  rosidl_adapter/cmake/rosidl_adapt_interfaces.cmake

DEPEND_ABI.python+=		python>=3.7
DEPEND_ABI.py-pybind11+=	${PKGTAG.python}-pybind11>=2.6

include ../../devel/ament-cmake-ros/depend.mk
include ../../devel/ros2-rcutils/depend.mk
include ../../mk/sysdep/py-lark-parser.mk
include ../../mk/sysdep/py-pybind11.mk
include ../../mk/sysdep/python.mk
include ../../mk/robotpkg.mk
