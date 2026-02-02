# robotpkg Makefile for:	robots/example-robot-data
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

ORG=			gepetto
NAME=			example-robot-data
VERSION=		4.4.0

CATEGORIES=		robots
COMMENT=		Robot URDFs for benchmarking and developed examples
LICENSE=		2-clause-bsd
MAINTAINER=		gepetto@laas.fr

CMAKE_ARGS+=		-DBUILD_PYTHON_INTERFACE=OFF

USE_MASTER_GITHUB=	true

include ../../devel/jrl-cmakemodules/depend.mk

include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
