# robotpkg Makefile for:	graphics/simple-humanoid-description
# Created:			Rohan Budhiraja on Wed Oct 19, 2016
#

ORG=			laas
NAME=			simple_humanoid_description
VERSION=		1.2.0

CATEGORIES=		graphics

COMMENT=		Rigid body model of a simple humanoid robot.
LICENSE=		2-clause-bsd
MAINTAINER=		hpp@laas.fr

include ../../devel/jrl-cmakemodules/Makefile.common

CMAKE_ARGS+=		-DCMAKE_POLICY_VERSION_MINIMUM=3.5

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
