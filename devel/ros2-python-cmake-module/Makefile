# robotpkg Makefile for:	devel/ros2-python-cmake-module
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

ROS2_PKG=	python_cmake_module
ROS2_VERSION=	0.12.0

CATEGORIES=	devel
ROS2_COMMENT=	CMake module for finding Python

include ../../meta-pkgs/ros2-core/Makefile.common

# Force cmake to find exact python version
SUBST_CLASSES+=	py-vers
SUBST_STAGE.py-vers=	pre-configure
SUBST_MESSAGE.py-vers=	Forcing exact python version search
SUBST_SED.py-vers=\
  -e 's|package(Python3 REQ|package(Python3 ${PYTHON_VERSION} EXACT REQ|'
SUBST_FILES.py-vers=\
  cmake/Modules/FindPythonExtra.cmake

include ../../mk/robotpkg.mk
