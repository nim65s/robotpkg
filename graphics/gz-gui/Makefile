# robotpkg Makefile for:	graphics/gz-gui
# Created:			Anthony Mallet on Thu, 27 Feb 2025
#

DISTNAME=	gz-gui-9.0.0

GZ_COMMENT=	graphical interfaces for robotics applications
CATEGORIES=	graphics

include ../../simulation/gz-sim/Makefile.common

SUBST_CLASSES+= rb-interp
SUBST_FILES.rb-interp+=\
	src/cmd/cmdgui.rb.in

DEPEND_ABI.gz-math+=		gz-math>=8<9
DEPEND_ABI.gz-msgs+=		gz-msgs>=11<12
DEPEND_ABI.gz-plugin+=		gz-plugin>=3<4
DEPEND_ABI.gz-rendering+=	gz-rendering>=9<10
DEPEND_ABI.gz-transport+=	gz-transport>=14<15
DEPEND_ABI.gz-utils+=		gz-utils>=3<4
DEPEND_ABI.qt5-qtbase+=		qt5-qtbase>=5.15

include ../../devel/gz-plugin/depend.mk
include ../../devel/gz-utils/depend.mk
include ../../graphics/gz-rendering/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../math/gz-math/depend.mk
include ../../net/gz-transport/depend.mk
include ../../sysutils/gz-tools/depend.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/sysdep/qt5-declarative.mk
include ../../mk/sysdep/qt5-graphicaleffects.mk
include ../../mk/sysdep/qt5-quickcontrols.mk
include ../../mk/sysdep/qt5-quickcontrols2.mk
include ../../mk/sysdep/ruby.mk
include ../../mk/robotpkg.mk
