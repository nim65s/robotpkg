# robotpkg Makefile for:	net/gz-fuel-tools
# Created:			Anthony Mallet on Thu, 27 Feb 2025
#

DISTNAME=	gz-fuel-tools-10.0.0

GZ_COMMENT=	classes and tools for interacting with Gazebo Fuel
CATEGORIES=	net

include ../../simulation/gz-sim/Makefile.common

SUBST_CLASSES+= rb-interp
SUBST_FILES.rb-interp+=\
	src/cmd/cmdfuel.rb.in

DEPEND_ABI.gz-common+=	gz-common>=6<7
DEPEND_ABI.gz-math+=	gz-math>=8<9
DEPEND_ABI.gz-msgs+=	gz-msgs>=11<12
DEPEND_ABI.gz-tools+=	gz-tools>=2<3
DEPEND_ABI.gz-utils+=	gz-utils>=3<4

include ../../devel/gz-utils/depend.mk
include ../../graphics/gz-common/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../math/gz-math/depend.mk
include ../../sysutils/gz-tools/depend.mk
include ../../mk/sysdep/jsoncpp.mk
include ../../mk/sysdep/libcurl.mk
include ../../mk/sysdep/libyaml.mk
include ../../mk/sysdep/libzip.mk
include ../../mk/sysdep/ruby.mk
include ../../mk/sysdep/tinyxml2.mk
include ../../mk/robotpkg.mk
