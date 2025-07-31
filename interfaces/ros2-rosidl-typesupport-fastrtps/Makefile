# robotpkg Makefile for:	interfaces/ros2-rosidl-typesupport-fastrtps
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

ROS2_PKG=	rosidl_typesupport_fastrtps
ROS2_VERSION=	3.7.1

CATEGORIES=	interfaces
ROS2_COMMENT=	typesupport for fastrtps

ROS2_SUBPKGS=\
  fastrtps_cmake_module			\
  rosidl_typesupport_fastrtps_c		\
  rosidl_typesupport_fastrtps_cpp

include ../../meta-pkgs/ros2-core/Makefile.common

# Force cmake to find exact python version
SUBST_CLASSES+=	py-vers
SUBST_STAGE.py-vers=	pre-configure
SUBST_MESSAGE.py-vers=	Forcing exact python version search
SUBST_SED.py-vers=\
  -e 's|package(Python3 REQ|package(Python3 ${PYTHON_VERSION} EXACT REQ|'
SUBST_FILES.py-vers=\
 */cmake/*_generate_interfaces.cmake

DEPEND_ABI.fastcdr+=	fastcdr>=2

include ../../devel/ament-cmake-ros/depend.mk
include ../../interfaces/ros2-rosidl/depend.mk
include ../../middleware/fastcdr/depend.mk
include ../../middleware/ros2-rmw/depend.mk
include ../../mk/robotpkg.mk
