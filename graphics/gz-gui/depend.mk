# robotpkg depend.mk for:	graphics/gz-gui
# Created:			Anthony Mallet on Thu, 27 Feb 2025
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GZ_GUI_DEPEND_MK:=		${GZ_GUI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gz-gui
endif

ifeq (+,$(GZ_GUI_DEPEND_MK)) # ---------------------------------------------

GZ_DEPEND_USE+=			gz-gui
include ../../simulation/gz-sim/depend.common

DEPEND_ABI.gz-gui?=		gz-gui>=8
DEPEND_DIR.gz-gui?=		../../graphics/gz-gui

SYSTEM_SEARCH.gz-gui=\
  'include/gz/gui[0-9]*/gz/gui.hh'		\
  'lib/libgz-gui[0-9]*.so'			\
  $(call gz_system_search,gz-gui,)

# transitive dependencies
include ../../devel/gz-plugin/depend.mk
include ../../devel/gz-utils/depend.mk
include ../../graphics/gz-rendering/depend.mk
include ../../interfaces/gz-msgs/depend.mk
include ../../math/gz-math/depend.mk
include ../../net/gz-transport/depend.mk
include ../../mk/sysdep/protobuf.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/sysdep/qt5-declarative.mk
include ../../mk/sysdep/qt5-quickcontrols2.mk

endif # GZ_GUI_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
