# robotpkg Makefile for:	net/gz-transport
# Created:			Anthony Mallet on Fri, 7 Feb 2025
#

DISTNAME=	gz-transport-14.0.0

GZ_COMMENT=	library for component communication
CATEGORIES=	net

include ../../simulation/gz-sim/Makefile.common

DEPEND_ABI.g++ +=	g++>=9.1
DEPEND_ABI.gz-msgs+=	gz-msgs>=11<12
DEPEND_ABI.gz-utils+=	gz-utils>=3<4

include ../../devel/gz-utils/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../sysutils/gz-tools/depend.mk
include ../../mk/sysdep/cppzmq.mk
include ../../mk/sysdep/libuuid.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/sysdep/sqlite3.mk
include ../../mk/sysdep/zeromq.mk
include ../../mk/robotpkg.mk
