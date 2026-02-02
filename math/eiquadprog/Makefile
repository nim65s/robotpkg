# robotpkg Makefile for:	math/eiquadprog
# Created:			Guilhem Saurel on Tue, 17 Sep 2019
#

ORG=			stack-of-tasks
NAME=			eiquadprog
VERSION=		1.3.1

CATEGORIES=		math
COMMENT=		algorithm of Goldfarb and Idnani for the solution of a QP
LICENSE=		gnu-lgpl-v3
MAINTAINER=		gepetto@laas.fr

DEPEND_ABI.eigen3+=	eigen3>=3.2.92

USE_MASTER_GITHUB=	true

include ../../devel/jrl-cmakemodules/depend.mk
include ../../math/eigen3/depend.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/pkg-config.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
