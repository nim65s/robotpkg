# robotpkg Makefile for:	devel/roscpp-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

PKGREVISION=	1
ROS_PKG=	bond_core
ROS_METAPKG=	yes
ROS_VERSION=	1.8.6

CATEGORIES=	devel
ROS_COMMENT=	process termination detection

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	test_bond/scripts/*.py
SUBST_FILES.py-interp+=	test_bond/test/*.py

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/sysdep/libuuid.mk
include ../../mk/robotpkg.mk
