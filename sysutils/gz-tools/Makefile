# robotpkg Makefile for:	sysutils/gz-tools
# Created:			Anthony Mallet on Thu,  6 Feb 2025
#

DISTNAME=	gz-tools-2.0.0

GZ_COMMENT=	command line interface
CATEGORIES=	sysutils

include ../../simulation/gz-sim/Makefile.common

SUBST_CLASSES+= rb-interp
SUBST_FILES.rb-interp+=\
	src/gz.in

CMAKE_ARGS+=	-DBACKWARD_TESTS=OFF
CMAKE_ARGS+=	-DRUBOCOP_PROGRAM=OFF

include ../../mk/sysdep/ruby.mk
include ../../mk/robotpkg.mk
