# robotpkg Makefile for:	optimization/py27-tsid
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

ORG=			stack-of-tasks
NAME=			tsid
VERSION=		1.7.1

CATEGORIES=		optimization
COMMENT=		Efficient Inverse Dynamics (python bindings)

USE_BOOST_LIBS=		unit_test_framework
USE_PYTHON_ONLY=	yes

# this does not support multiple parallel python version
CONFLICTS+=		py[0-9][0-9]-tsid-[0-9]*

DEPEND_ABI.python=	python>=3.6

include ../../devel/jrl-cmakemodules/Makefile.common
include ../../graphics/urdfdom/depend.mk
include ../../mapping/octomap/depend.mk
include ../../math/eiquadprog/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/pinocchio/depend.mk
include ../../math/py-eigenpy/depend.mk
include ../../math/py-pinocchio/depend.mk
include ../../optimization/tsid/depend.mk
include ../../path/hpp-fcl/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++11.mk
include ../../mk/robotpkg.mk
